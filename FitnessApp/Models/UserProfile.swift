//
//  UserProfile.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

struct UserProfile: Identifiable, Codable {
    let id: UUID
    var name: String
    var age: Int?
    var weight: Double?
    var height: Double?
    var goalCalories: Int?
    var goalSteps: Int?
    var prefersKg: Bool
    var prefersRPE: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        age: Int? = nil,
        weight: Double? = nil,
        height: Double? = nil,
        goalCalories: Int? = nil,
        goalSteps: Int? = nil,
        prefersKg: Bool = true,
        prefersRPE: Bool = true
    ) {
        self.id = id
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height
        self.goalCalories = goalCalories
        self.goalSteps = goalSteps
        self.prefersKg = prefersKg
        self.prefersRPE = prefersRPE
    }
}
