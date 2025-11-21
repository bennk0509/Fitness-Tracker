//
//  SetLog.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import Foundation

struct SetLog: Identifiable, Codable{
    let id: UUID
    let setNumber: Int
    
    
    var weight: Double
    var reps: Int
    var rest: Int
    var rpe: Double?
    
    init(id: UUID = UUID(), setNumber: Int, weight: Double, reps: Int, rest: Int, rpe: Double? = nil) {
        self.id = id
        self.setNumber = setNumber
        self.weight = weight
        self.reps = reps
        self.rest = rest
        self.rpe = rpe
    }
    
}
