//
//  DeleteExerciseFromSession.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI

final class DeleteExerciseFromSession {
    private let repo: WorkoutSessionRepository

    init(repo: WorkoutSessionRepository) {
        self.repo = repo
    }

    func execute(sessionId: UUID, exerciseId: UUID) throws -> WorkoutSession {
        var session = try repo.fetchWorkout(id: sessionId)
        session.exercises.removeAll { $0.id == exerciseId }
        try repo.saveWorkout(session)
        return session
    }
}
