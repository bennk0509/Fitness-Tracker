//
//  User.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//
import Foundation

struct User: Identifiable, Codable{
    let id: UUID
    
    var name: String
    var dateOfBirth: Date?
    var gender: Gender?
    
    var unitSystem: UnitSystem
    var weightHistory: [BodyMetric]?
    
}
