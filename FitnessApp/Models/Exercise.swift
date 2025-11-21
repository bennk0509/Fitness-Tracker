//
//  Exercise.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//


import Foundation

struct Exercise: Identifiable, Codable {
    let id: UUID
    let name: String
    let templateID: UUID?
    var sets: [SetLog]
    
    init(id: UUID = UUID(), name: String, sets: [SetLog], templateID: UUID? = nil) {
        self.id = id
        self.name = name
        self.sets = sets
        self.templateID = templateID
    }
    
}
