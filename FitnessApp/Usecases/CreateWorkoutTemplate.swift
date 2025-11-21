//
//  CreateWorkoutTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

final class CreateWorkoutTemplate{
    private let repository: WorkoutTemplateRepository
    
    init(repository: WorkoutTemplateRepository) {
        self.repository = repository
    }
    
    func execute(name:String, exercises: [ExerciseTemplate])
    {
        let template = WorkoutTemplate(name: name, defaultExercises: exercises)
        repository.saveTemplate(template);
    }
    
}
