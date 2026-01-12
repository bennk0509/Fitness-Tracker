//
//  AddExerciseFromTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI

final class AddExerciseFromTemplate {
    private let repo: WorkoutSessionRepository

    init(repo: WorkoutSessionRepository) {
        self.repo = repo
    }

    func execute(sessionId: UUID, template: ExerciseTemplate) throws -> WorkoutSession {
        var session = try repo.fetchWorkout(id: sessionId)
        session.exercises.append(template.toExercise())
        try repo.saveWorkout(session)
        return session
    }
}
