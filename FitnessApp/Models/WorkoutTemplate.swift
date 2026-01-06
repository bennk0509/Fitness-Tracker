//
//  WorkoutTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//
import Foundation

struct WorkoutTemplate: Identifiable, Codable {
    let id: UUID
    var name: String
    var defaultExercises: [ExerciseTemplate]
    
    init(id: UUID = UUID(), name: String, defaultExercises: [ExerciseTemplate]) {
        self.id = id
        self.name = name
        self.defaultExercises = defaultExercises
    }
}

extension WorkoutTemplate{
    func toWorkoutSession() -> WorkoutSession {
        let exercises = defaultExercises.map { $0.toExercise() }
        
        return WorkoutSession(
                    name: name,
                    duration: 0,
                    calories: 0,
                    date: Date(),
                    intensity: nil,
                    exercises: exercises,
                    templateID: id
                )
    }
    
    func toWorkoutSession(exercises: [ExerciseTemplate]) -> WorkoutSession {
        let exercises = exercises.map { $0.toExercise() }
        return WorkoutSession(
                name: name,
                duration: 0,
                calories: 0,
                date: Date(),
                intensity: nil,
                exercises: exercises,
                templateID: id
            )
    }
}
