//
//  MockupWorkoutTemplateRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

class MockupWorkoutTemplateRepository: WorkoutTemplateRepository{
    func fetchAllTemplates() -> [WorkoutTemplate] {
        sampleWorkoutTemplates
    }
    
    func fetchTemplate(by id: UUID) -> WorkoutTemplate? {
        return sampleWorkoutTemplates.first(where: { $0.id == id })
    }
    
    func getAllTemplates() -> [WorkoutTemplate] {
        sampleWorkoutTemplates
    }
    
    func getTemplate(by id: UUID) -> WorkoutTemplate? {
        return sampleWorkoutTemplates.first(where: { $0.id == id })
    }
    
    func saveTemplate(_ template: WorkoutTemplate) {
        
    }
    
    func deleteTemplate(id: UUID) {
        
    }
    
    
}
