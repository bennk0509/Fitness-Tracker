//
//  AddSetToExercise.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import Foundation

final class AddSetToExercise{
    private let workoutSessionRepository: WorkoutSessionRepository
    
    init(workoutSessionRepository: WorkoutSessionRepository) {
        self.workoutSessionRepository = workoutSessionRepository
    }
    
    func execute(sessionId: UUID, exerciseId: UUID) throws -> WorkoutSession {
        var session = try workoutSessionRepository.fetchWorkout(id: sessionId)
        
        guard let exIdx = session.exercises.firstIndex(where: { $0.id == exerciseId }) else { return session }

        let next = (session.exercises[exIdx].sets.map(\.setNumber).max() ?? 0) + 1
        let newSet = SetLog(id: UUID(), setNumber: next, weight: 0, reps: 0, rest: 0)

        session.exercises[exIdx].sets.append(newSet)
        workoutSessionRepository.saveWorkout(session)
        return session
    }
}
//AddSetToExercise
//DeleteSetFromExercise
//UpdateSetWeight
//UpdateSetReps
//AddExerciseFromTemplate
//DeleteExerciseFromSession
//FinishWorkoutSession
