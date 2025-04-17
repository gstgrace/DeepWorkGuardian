//
//  SettingsView.swift
//  DeepWorkGuardian
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var sessionManager: SessionManager
    @Environment(\.presentationMode) var presentationMode
    @State private var demoMode: Bool = false
    // Default custom intervals in minutes.
    @State private var customExerciseInterval: Double = 60.0
    @State private var customEyeRestInterval: Double = 20.0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Demo Mode")) {
                    Toggle("Enable Demo Mode", isOn: $demoMode)
                        .onChange(of: demoMode) { value in
                            sessionManager.setDemoMode(value)
                        }
                }
                
                Section(header: Text("Customize Intervals (Minutes)")) {
                    VStack(alignment: .leading) {
                        Text("Exercise Reminder: \(Int(customExerciseInterval)) min")
                        Slider(value: $customExerciseInterval, in: 30...90, step: 5)
                    }
                    VStack(alignment: .leading) {
                        Text("Eye Rest Reminder: \(Int(customEyeRestInterval)) min")
                        Slider(value: $customEyeRestInterval, in: 10...30, step: 1)
                    }
                }
                
                Section {
                    Button("Test Notification") {
                        sessionManager.sendReminder(type: .exercise)
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") { presentationMode.wrappedValue.dismiss() },
                trailing: Button("Save") {
                    // Apply custom intervals only if demo mode is off.
                    if !demoMode {
                        sessionManager.exerciseInterval = Int(customExerciseInterval * 60)
                        sessionManager.eyeRestInterval = Int(customEyeRestInterval * 60)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
