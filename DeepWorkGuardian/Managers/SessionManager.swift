//
//  SessionManager.swift
//  DeepWorkGuardian
//

import SwiftUI
import Combine
import UserNotifications

class SessionManager: ObservableObject {
    @Published var isSessionActive: Bool = false
    @Published var totalTimeElapsed: Int = 0
    
    // Default intervals (in seconds): 60 minutes for exercise and 20 minutes for eye rest.
    @Published var exerciseInterval: Int = 3600
    @Published var eyeRestInterval: Int = 1200
    
    // Elapsed time counters.
    @Published var exerciseElapsed: Int = 0
    @Published var eyeRestElapsed: Int = 0
    
    private var timer: AnyCancellable?
    
    func formatTime(_ seconds: Int) -> String {
        let hrs = seconds / 3600
        let mins = (seconds % 3600) / 60
        let secs = seconds % 60
        if hrs > 0 {
            return String(format: "%02d:%02d:%02d", hrs, mins, secs)
        } else {
            return String(format: "%02d:%02d", mins, secs)
        }
    }
    
    func toggleSession() {
        isSessionActive ? stopSession() : startSession()
    }
    
    private func startSession() {
        isSessionActive = true
        totalTimeElapsed = 0
        exerciseElapsed = 0
        eyeRestElapsed = 0
        
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }
    
    private func stopSession() {
        isSessionActive = false
        timer?.cancel()
        timer = nil
    }
    
    private func tick() {
        totalTimeElapsed += 1
        exerciseElapsed += 1
        eyeRestElapsed += 1
        
        // If exercise reminder is due...
        if exerciseElapsed >= exerciseInterval {
            sendReminder(type: .exercise)
            exerciseElapsed = 0
            // If eye rest is also due at the same tick, skip it by resetting.
            if eyeRestElapsed >= eyeRestInterval {
                eyeRestElapsed = 0
            }
        }
        // Otherwise, if only eye rest is due...
        else if eyeRestElapsed >= eyeRestInterval {
            sendReminder(type: .eyeRest)
            eyeRestElapsed = 0
        }
    }
    
    func sendReminder(type: ReminderType) {
        scheduleLocalNotification(title: type.notificationTitle, body: type.notificationBody)
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    private func scheduleLocalNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
    
    func setDemoMode(_ isDemo: Bool) {
        if isDemo {
            exerciseInterval = 10   // 10 seconds for demo.
            eyeRestInterval = 5     // 5 seconds for demo.
        }
        // If demo mode is off, the custom intervals from the SettingsView will be applied.
    }
}
