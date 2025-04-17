//
//  ExerciseListView.swift
//  DeepWorkGuardian
//
//  Created by Grace G on 2/11/25.
//

import SwiftUI

struct ExerciseListView: View {
    let exercises: [Exercise]
    @Binding var selectedExercise: Exercise?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(exercises) { exercise in
                HStack(spacing: 15) {
                    Image(systemName: exercise.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text(exercise.name)
                            .font(.headline)
                        Text(exercise.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    if selectedExercise?.id == exercise.id {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedExercise = exercise
                }
            }
            .navigationTitle("Choose Your Exercise")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
