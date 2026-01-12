//
//  GetWorkoutSessionById.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-06.
//

import Foundation

final class GetWorkoutSessionById{
    private let repository: WorkoutSessionRepository
    
    init(repository: WorkoutSessionRepository)
    {
        self.repository = repository
    }
    func execute(id: UUID) throws -> WorkoutSession? {
        try repository.fetchWorkout(id: id)
    }
}

