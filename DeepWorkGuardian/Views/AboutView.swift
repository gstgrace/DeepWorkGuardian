//
//  IntroView.swift
//  DeepWorkGuardian
//
//  Created by Grace G on 2/11/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("DeepWork Guardian")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("""
Long hours of coding without breaks can lead to eye strain, poor posture, and other health issues. DeepWork Guardian reminds you to move and rest your eyes so you stay productive and healthy.
""")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("**Modes:**")
                            .font(.headline)
                        Text("• **Regular Mode:** Uses custom intervals you set in Settings (default: 60 min for exercise, 20 min for eye rest).")
                        Text("• **Demo Mode:** Uses very short intervals (10 sec for exercise, 5 sec for eye rest) so you can quickly see how notifications work.")
                        Text("You May toggle Demo Mode in Settings at any time.")
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(uiColor: .systemBackground))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
