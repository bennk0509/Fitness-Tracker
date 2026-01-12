//
//  UpdateSetWeight.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI


final class UpdateSetWeight {
    private let repo: WorkoutSessionRepository

    init(repo: WorkoutSessionRepository) {
        self.repo = repo
    }

    func execute(sessionId: UUID, exerciseId: UUID, setId: UUID, weight: Double) throws -> WorkoutSession {
        var session = try repo.fetchWorkout(id: sessionId)

        guard let exIdx = session.exercises.firstIndex(where: { $0.id == exerciseId }),
              let setIdx = session.exercises[exIdx].sets.firstIndex(where: { $0.id == setId }) else {
            throw WorkoutSessionError.invalidSet
        }

        session.exercises[exIdx].sets[setIdx].weight = weight
        try repo.saveWorkout(session)
        return session
    }
}
