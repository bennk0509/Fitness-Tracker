//
//  DeleteSetFromExercise.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import Foundation

final class DeleteSetFromExercise{
    private let workoutSessionRepository: WorkoutSessionRepository
    
    init(workoutSessionRepository: WorkoutSessionRepository) {
        self.workoutSessionRepository = workoutSessionRepository
    }
    
    func execute(sessionId: UUID, exerciseId: UUID, setId: UUID) throws -> WorkoutSession {
        var session = try workoutSessionRepository.fetchWorkout(id: sessionId)
        
        guard let exIdx = session.exercises.firstIndex(where: { $0.id == exerciseId }) else {
            throw WorkoutSessionError.invalidExercise
        }
        
        session.exercises[exIdx].sets.removeAll { $0.id == setId }
        try workoutSessionRepository.saveWorkout(session)
        return session
    }
}
