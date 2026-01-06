//
//  Workout.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import Foundation

struct WorkoutSession: Identifiable, Codable {
    let id: UUID
    let date: Date
    let templateID: UUID?
    
    var name: String
    var duration: Int
    var calories: Int
    var intensity: String?
    var startedAt: Date?
    var endedAt: Date?
    var description: String?
    var exercises: [Exercise]
    
    init(id: UUID = UUID(),
         name: String,
         duration: Int = 0,
         calories: Int = 0,
         date: Date = Date(),
         intensity: String? = nil,
         exercises: [Exercise] = [],
         templateID: UUID? = nil) {
        
        self.id = id
        self.name = name
        self.duration = duration
        self.calories = calories
        self.date = date
        self.intensity = intensity
        self.exercises = exercises
        self.templateID = templateID
    }
}
