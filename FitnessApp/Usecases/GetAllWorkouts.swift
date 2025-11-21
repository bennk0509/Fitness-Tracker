//
//  GetAllWorkouts.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

final class GetAllWorkouts{
    private let repository: WorkoutSessionRepository
    
    init(repository: WorkoutSessionRepository) {
        self.repository = repository
    }
    
    func execute() -> [WorkoutSession] {
        repository.fetchAllWorkouts()
    }
}
