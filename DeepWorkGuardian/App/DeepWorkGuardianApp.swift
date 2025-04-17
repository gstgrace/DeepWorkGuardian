//
//  DeepWorkGuardianApp.swift
//
//  Created by Grace G on 1/15/25.
//

import SwiftUI

@main
struct DeepWorkGuardianApp: App {
    // Inject AppDelegate to handle notifications
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

