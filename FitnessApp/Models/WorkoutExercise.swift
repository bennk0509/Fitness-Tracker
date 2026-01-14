//
//  WorkoutExercise.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//

import Foundation


struct WorkoutExercise: Identifiable, Codable{
    let id: UUID
    let exerciseId: UUID
    let exerciseName: String
    var sets: [WorkoutSet]
    
    var totalVolume: Double {
        sets.filter { $0.isCompleted }
            .reduce(0) { $0 + ($1.weight * Double($1.reps)) }
    }
    
    var maxWeight: Double {
        sets.map { $0.weight }.max() ?? 0
    }
}
