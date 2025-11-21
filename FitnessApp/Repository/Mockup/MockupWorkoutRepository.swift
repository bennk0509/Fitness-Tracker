//
//  MockUpWorkoutRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import SwiftUI



class MockUpWorkoutRepository: WorkoutRepository{
    func fetchRecentWorkouts() -> [Workout] {
        return sampleWorkouts
    }
    func fetchAllWorkouts() -> [Workout] {
        return sampleWorkouts
    }
    
}
