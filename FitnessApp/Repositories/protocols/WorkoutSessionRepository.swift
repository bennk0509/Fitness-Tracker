//
//  WorkoutRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//
import Foundation

protocol WorkoutSessionRepository{
    func fetchRecentWorkouts() -> [WorkoutSession]
    func fetchAllWorkouts() -> [WorkoutSession]
    func fetchWorkout(id: UUID) throws -> WorkoutSession
    func saveWorkout(_ workout: WorkoutSession)
    func updateWorkout(_ workout: WorkoutSession)
    func deleteWorkout(id: UUID)
}
