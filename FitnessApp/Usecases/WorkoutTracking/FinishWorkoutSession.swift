//
//  FinishWorkoutSession.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-06.
//

import SwiftUI

final class FinishWorkoutSession {
    private let repo: WorkoutSessionRepository

    init(repo: WorkoutSessionRepository) {
        self.repo = repo
    }

    func execute(sessionId: UUID, durationSeconds: Int) throws -> WorkoutSession {
        var session = try repo.fetchWorkout(id: sessionId)

        session.endedAt = Date()
        session.duration = durationSeconds

        try repo.saveWorkout(session)
        return session
    }
}
