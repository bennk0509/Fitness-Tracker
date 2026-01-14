//
//  MuscleGroup.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-13.
//

enum MuscleGroup: String, CaseIterable, Codable{
    case chest = "Chest"
    case back = "Back"
    case shoulders = "Shoulders"
    case quads = "Quads"
    case hamstrings = "Hamstrings"
    case glutes = "Glutes"
    case abs = "Abs"
    
    
    // Minor Groups
    case biceps = "Biceps"
    case triceps = "Triceps"
    case calves = "Calves"
    case forearms = "Forearms"
    case traps = "Traps"
    case lowerBack = "Lower Back"
    
    // Khác
    case cardio = "Cardio"
    case fullBody = "Full Body"
}
