//
//  Template.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//

import Foundation

struct Template: Identifiable, Codable{
    let id: UUID
    
    let name: String
    let exercises: [WorkoutExercise]
}
