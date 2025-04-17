//
//  IntroOverlayView.swift
//  DeepWorkGuardian
//
//  Created by Grace G on 2/11/25.
//

import SwiftUI

struct IntroOverlayView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("Welcome to DeepWork Guardian")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("""
Long hours of coding without breaks can lead to eye strain, poor posture, and other health issues. This app reminds you to move and rest your eyes, ensuring you stay productive and healthy.
""")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("**Modes:**")
                        .font(.headline)
                    Text("• **Regular Mode:** Uses your custom intervals (default: 60 min exercise, 20 min eye rest).")
                    Text("• **Demo Mode:** Uses short intervals (10 sec exercise, 5 sec eye rest) for quick testing.")
                    Text("To switch modes, open Settings and toggle **Demo Mode**.")
                }
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    isShowing = false
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .padding()
        }
    }
}
