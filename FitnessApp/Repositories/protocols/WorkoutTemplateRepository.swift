//
//  WorkoutTemplateRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

protocol WorkoutTemplateRepository{
    func fetchAllTemplates() -> [WorkoutTemplate]
    func fetchTemplate(by id: UUID) -> WorkoutTemplate?
    func saveTemplate(_ template: WorkoutTemplate)
    func deleteTemplate(id: UUID)
}
