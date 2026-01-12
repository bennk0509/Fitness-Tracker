//
//  MockupExerciseTemplateRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import Foundation
 
class MockupExerciseTemplateRepository: ExerciseTemplateRepository{

    func fetchAllExerciseTemplate() -> [ExerciseTemplate] {
        return sampleExerciseTemplates
    }
    
    func fetchExerciseTemplate(by id: UUID) -> ExerciseTemplate? {
        return sampleExerciseTemplates.first(where: { $0.id == id })
    }
    
    func saveExerciseTemplate(_ template: ExerciseTemplate) {
        
    }
    
    func deleteExerciseTemplate(id: UUID) {
        
    }
    
    
}
