//
//  RootView.swift
//  DeepWorkGuardian
//
//  Created by Grace G on 2/10/25.
//

import SwiftUI

struct RootView: View {
    @State private var showIntro: Bool = true
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.systemBackground
        
        let normalAttrs = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        let selectedAttrs = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .systemGray
        appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttrs
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttrs
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        UITabBar.appearance().tintColor = .systemBlue
    }
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
        // 2) Overlay the intro when first launched
        .overlay(
            Group {
                if showIntro {
                    IntroOverlayView(isShowing: $showIntro)
                }
            }
        )
    }
}
