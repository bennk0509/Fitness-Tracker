//
//  RestRequest.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-07.
//
import Foundation

struct RestRequest: Identifiable, Equatable {
    let id = UUID()
    let seconds: Int
    let exerciseId: UUID
    let setId: UUID
}
