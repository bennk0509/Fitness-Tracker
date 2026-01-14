//
//  Exercise.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//
import Foundation

struct Exercise: Identifiable, Codable{
    let id: UUID
    let name: String
    let primaryMuscle: MuscleGroup
    let secondaryMuscles: [MuscleGroup]?
    let instruction: String?
    let imageURL: String?
    let equipment: EquipmentType?
    
    var displayImageName: String {
        return imageURL ?? "default_exercise_icon"
    }
    
    init(
        id: UUID = UUID(),
        name: String,
        primaryMuscle: MuscleGroup,
        secondaryMuscles: [MuscleGroup]? = nil,
        instruction: String? = nil,
        imageURL: String? = nil,
        equipment: EquipmentType
    ) {
        self.id = id
        self.name = name
        self.primaryMuscle = primaryMuscle
        self.secondaryMuscles = secondaryMuscles
        self.instruction = instruction
        self.imageURL = imageURL
        self.equipment = equipment
    }
    
}
