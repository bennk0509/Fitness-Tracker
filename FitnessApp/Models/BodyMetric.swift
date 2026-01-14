//
//  BodyMetric.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-14.
//

import Foundation


struct BodyMetric: Identifiable, Codable {
    let id: UUID
    let date: Date
    
    var weight: Double
    var bodyFat: Double?
    
    var photoData: [Data]?
}
