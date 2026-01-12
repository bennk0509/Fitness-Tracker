//
//  UpdateSetReps.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI

final class UpdateSetReps {
    private let repo: WorkoutSessionRepository

    init(repo: WorkoutSessionRepository) {
        self.repo = repo
    }

    func execute(sessionId: UUID, exerciseId: UUID, setId: UUID, reps: Int) throws -> WorkoutSession {
        var session = try repo.fetchWorkout(id: sessionId)

        guard let exIdx = session.exercises.firstIndex(where: { $0.id == exerciseId }),
              let setIdx = session.exercises[exIdx].sets.firstIndex(where: { $0.id == setId }) else {
            throw WorkoutSessionError.invalidSet
        }

        session.exercises[exIdx].sets[setIdx].reps = reps
        try repo.saveWorkout(session)
        return session
    }
}
