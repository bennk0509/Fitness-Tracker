//
//  ExerciseTemplateRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import Foundation

protocol ExerciseTemplateRepository{
    func fetchAllExerciseTemplate() -> [ExerciseTemplate]
    func fetchExerciseTemplate(by id: UUID) -> ExerciseTemplate?
    func saveExerciseTemplate(_ template: ExerciseTemplate)
    func deleteExerciseTemplate(id: UUID)
}
