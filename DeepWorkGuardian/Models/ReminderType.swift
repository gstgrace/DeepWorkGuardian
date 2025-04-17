//
//  ReminderType.swift
//  DeepWorkGuardian
//

import Foundation

enum ReminderType {
    case exercise
    case eyeRest
    
    var notificationTitle: String {
        switch self {
        case .exercise:
            return "Time to Move!"
        case .eyeRest:
            return "Rest Your Eyes"
        }
    }
    
    var notificationBody: String {
        switch self {
        case .exercise:
            return "Stand up and get moving for a few minutes."
        case .eyeRest:
            return "Look away from the screen to rest your eyes."
        }
    }
}
