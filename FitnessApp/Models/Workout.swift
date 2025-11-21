//
//  Workout.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let name: String
    let duration: Int       // minutes
    let calories: Int
    let date: Date
    let intensity: String?
}
