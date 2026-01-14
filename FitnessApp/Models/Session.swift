//
//  Session.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//

import Foundation

struct Session: Identifiable, Codable{
    let id: UUID
    let templateId: UUID?
    
    
    var name: String
    var startTime: Date
    var endTime: Date?
    
    var notes: String
    var exercises: [WorkoutExercise]
    
    var totalVolume: Double {
        exercises.reduce(0) { $0 + $1.totalVolume }
    }
    
    
    var durationInMinutes: Int {
        guard let end = endTime else { return 0 }
        let diff = end.timeIntervalSince(startTime)
        return Int(diff / 60)
    }
    
    
    init(from template: Template) {
        self.id = UUID()
        self.templateId = template.id
        self.name = template.name
        self.startTime = Date()
        self.endTime = nil
        self.notes = ""
        
        self.exercises = template.exercises.map { exercise in
            var newExercise = exercise
            newExercise.id = UUID()
            newExercise.sets = exercise.sets.map { set in
                var newSet = set
                newSet.id = UUID()
                newSet.isCompleted = false
                return newSet
            }
            return newExercise
        }
    }
    
    init(id: UUID = UUID(), templateId: UUID? = nil, name: String, startTime: Date = Date(), endTime: Date? = nil, notes: String = "", exercises: [WorkoutExercise] = []) {
            self.id = id
            self.templateId = templateId
            self.name = name
            self.startTime = startTime
        self.endTime = endTime
            self.notes = notes
            self.exercises = exercises
        }
    
    
}
