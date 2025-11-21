//
//  WorkoutRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

protocol WorkoutRepository{
    func fetchRecentWorkouts() -> [Workout]
    func fetchAllWorkouts() -> [Workout]
}
