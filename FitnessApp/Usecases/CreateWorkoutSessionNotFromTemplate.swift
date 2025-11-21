//
//  CreateWorkoutSessionNotFromTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

final class CreateWorkoutSessionNotFromTemplate{
    private let workoutSessionRepository: WorkoutSessionRepository
    private let workoutTemplateRepository: WorkoutTemplateRepository
    
    
    init(workoutSessionRepository: WorkoutSessionRepository, workoutTemplateRepository: WorkoutTemplateRepository) {
        self.workoutSessionRepository = workoutSessionRepository
        self.workoutTemplateRepository = workoutTemplateRepository
    }
 
    func execute(exercises: [ExerciseTemplate], name: String) -> WorkoutSession{
        let exercises = exercises.map { $0.toExercise() }
        
        let workoutSession = WorkoutSession(name: name, exercises: exercises)
        
        
        workoutSessionRepository.saveWorkout(workoutSession)
        return workoutSession
        
    }
    
}
