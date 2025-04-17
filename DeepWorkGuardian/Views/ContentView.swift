//
//  ContentView.swift
//  DeepWorkGuardian
//

import SwiftUI

struct ContentView: View {
    @StateObject private var sessionManager = SessionManager()
    @State private var showingSettings = false
    @State private var showingExerciseList = false
    @State private var selectedExercise: Exercise? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if sessionManager.isSessionActive {
                    Text("Session Time: \(sessionManager.formatTime(sessionManager.totalTimeElapsed))")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(15)
                } else {
                    Text("Press Start to begin your session.")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .padding()
                }
                
                // Selected Exercise Card
                if let exercise = selectedExercise {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: exercise.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.blue)
                            Text(exercise.name)
                                .font(.headline)
                            Spacer()
                        }
                        Text(exercise.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(15)
                } else {
                    Text("No exercise selected. Please choose one.")
                        .foregroundColor(.secondary)
                }
                
                // Choose Exercise Button
                Button(action: {
                    showingExerciseList = true
                }) {
                    Text("Choose Exercise")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor.opacity(0.1))
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showingExerciseList) {
                    ExerciseListView(exercises: sampleExercises, selectedExercise: $selectedExercise)
                }
                
                // Start or Stop Session Button
                Button(action: {
                    sessionManager.toggleSession()
                }) {
                    Text(sessionManager.isSessionActive ? "End Session" : "Start Session")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(sessionManager.isSessionActive ? Color.red : Color.green)
                        .cornerRadius(15)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("DeepWork Guardian")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingSettings = true
                    }) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView(sessionManager: sessionManager)
            }
            .background(Color(uiColor: .systemBackground))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
