//
//  SampleData.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import Foundation

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

var todayActivity: Activity {
    let steps: Int = 12000
    let calories: Int = 1200
    let exercise: Int = 60
    return Activity(steps: steps, calories: calories, exercise: exercise)
}
