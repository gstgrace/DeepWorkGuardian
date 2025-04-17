//
//  Exercise.swift
//  DeepWorkGuardian
//
//  Created by Grace G on 2/11/25.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

let sampleExercises = [
    Exercise(name: "Quick Walk", description: "Stand up and take a brisk walk around your space.", imageName: "figure.walk"),
    Exercise(name: "March in Place", description: "Lift your knees high while marching on the spot.", imageName: "figure.run"),
    Exercise(name: "Stair Climb", description: "If available, quickly climb a few stairs.", imageName: "figure.walk.circle"),
    Exercise(name: "Side Steps", description: "Take lateral steps to stretch and move.", imageName: "arrow.left.arrow.right"),
    Exercise(name: "Calf Raises", description: "Stand on your toes and slowly lower down.", imageName: "figure.stand")
]
