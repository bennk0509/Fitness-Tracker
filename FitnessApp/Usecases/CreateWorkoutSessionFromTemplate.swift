//
//  CreateWorkoutSessionFromTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

final class CreateWorkoutSessionFromTemplate{
    private let workoutSessionRepository: WorkoutSessionRepository
    private let workoutTemplateRepository: WorkoutTemplateRepository
    
    
    init(workoutSessionRepository: WorkoutSessionRepository, workoutTemplateRepository: WorkoutTemplateRepository) {
        self.workoutSessionRepository = workoutSessionRepository
        self.workoutTemplateRepository = workoutTemplateRepository
    }
    
    func execute(templateId: UUID) -> WorkoutSession? {
        // Find template from template repository
        guard let workoutTemplate = workoutTemplateRepository.fetchTemplate(by: templateId) else {return nil}

        let newWorkoutSession = workoutTemplate.toWorkoutSession()
        
        workoutSessionRepository.saveWorkout(newWorkoutSession);
        
        return newWorkoutSession
    }
    
    func execute(templateId: UUID, editedExercises: [ExerciseTemplate]) -> WorkoutSession? {
            guard let workoutTemplate = workoutTemplateRepository.fetchTemplate(by: templateId) else { return nil }
            let exercisesToUse = editedExercises.isEmpty ? workoutTemplate.defaultExercises : editedExercises

            let newWorkoutSession = workoutTemplate.toWorkoutSession(exercises: exercisesToUse)

            workoutSessionRepository.saveWorkout(newWorkoutSession)
            return newWorkoutSession
        }
}
