//
//  WorkoutSet.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//

import Foundation

struct WorkoutSet: Identifiable, Codable{
    let id: UUID
    var weight: Double
    var reps: Int
    var isCompleted: Bool
    
    var rpe: Int?
    var restTime: Int?
    
    var volume: Double {
        weight * Double(reps)
    }
}
