//
//  ExerciseTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

struct ExerciseTemplate: Identifiable, Codable{
    let id: UUID
    var name: String
    var defaultSets: [SetLog]?
    
    init(id: UUID, name: String, defaultSets: [SetLog]? = nil) {
        self.id = id
        self.name = name
        self.defaultSets = defaultSets
    }
}


extension ExerciseTemplate{
    func toExercise() -> Exercise {
        let mappedSets = (defaultSets ?? []).map { set in
            SetLog(
                setNumber: set.setNumber,
                weight: set.weight,
                reps: set.reps,
                rest: set.rest,
            )
        }

        return Exercise(
            id: UUID(),
            name: self.name,
            sets: mappedSets,
            templateID: self.id
        )
    }
}
