//
//  GetAllWorkoutTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

final class GetAllWorkoutTemplate{
    private let repository: WorkoutTemplateRepository
    init(repository: WorkoutTemplateRepository) {
        self.repository = repository
    }
    func execute() -> [WorkoutTemplate]
    {
        repository.fetchAllTemplates()
    }
}
