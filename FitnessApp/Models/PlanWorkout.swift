//
//  PlanWorkout.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//
import Foundation

struct PlanWorkout: Identifiable, Codable{
    let id: UUID
    let templateId: UUID
    
    var date: Date
    var name: String
    var isCompleted: Bool
}
