//
//  MockUpWorkoutRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import SwiftUI



class MockUpWorkoutRepository: WorkoutSessionRepository{
    private var workouts: [WorkoutSession] = sampleWorkouts
    
    func fetchWorkout(id: UUID) throws -> WorkoutSession {
        guard let s = workouts.first(where: { $0.id == id }) else{ throw WorkoutSessionError.notFound }
        return s
    }
    
    func saveWorkout(_ workout: WorkoutSession) {
        workouts.append(workout)
    }
    
    func updateWorkout(_ workout: WorkoutSession) {
        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
            workouts[index] = workout
        }
    }
    
    func deleteWorkout(id: UUID) {
        workouts.removeAll{ $0.id == id }
    }
    
    func fetchRecentWorkouts() -> [WorkoutSession] {
        Array(workouts.prefix(5))
    }
    func fetchAllWorkouts() -> [WorkoutSession] {
        return workouts
    }
    
}
