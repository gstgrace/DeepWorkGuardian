//
//  ReminderCardView.swift
//  DeepWorkGuardian
//

import SwiftUI

struct ReminderCardView: View {
    let title: String
    let iconName: String
    let remainingTime: Int
    let totalInterval: Int
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                Text(title)
                    .font(.headline)
                    .padding(.leading, 5)
                Spacer()
                Text(timeString(remainingTime))
                    .font(.subheadline)
                    .monospacedDigit()
            }
            .padding(.horizontal)
            
            ProgressView(value: Double(totalInterval - remainingTime), total: Double(totalInterval))
                .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                .padding([.horizontal, .bottom])
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
    
    // Formats seconds into MM:SS
    private func timeString(_ seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

