//
//  GetAllExerciseTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import Foundation

final class GetAllExerciseTemplate{
    private let repository: ExerciseTemplateRepository
    init(repository: ExerciseTemplateRepository) {
        self.repository = repository
    }
    func execute() -> [ExerciseTemplate]
    {
        repository.fetchAllExerciseTemplate()
    }
}
