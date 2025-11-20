//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct Workout: Identifiable {
    let id = UUID()
    let name: String
    let duration: Int       // minutes
    let calories: Int
    let date: Date
    let intensity: String?
}

let sampleWorkouts: [Workout] = [
    Workout(
        name: "Full Body Strength",
        duration: 25,
        calories: 240,
        date: Date(),
        intensity: "Intermediate"
    ),
    Workout(
        name: "HIIT 10-Min Blast",
        duration: 10,
        calories: 150,
        date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
        intensity: "Intense"
    ),
    Workout(
        name: "Yoga Flow",
        duration: 20,
        calories: 90,
        date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
        intensity: "Light"
    )
]

@Observable
class HomeViewModel{
    var move: Int = 5000;
    var exercise: Int = 25;
    var caloriesBurned: Int = 1250;
    var workouts: [Workout] = sampleWorkouts;
}
