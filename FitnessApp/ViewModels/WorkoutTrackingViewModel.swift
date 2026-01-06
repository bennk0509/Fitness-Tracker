//
//  WorkoutTrackingViewModel.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-06.
//

import SwiftUI

@Observable
class WorkoutTrackingViewModel{
    let sessionId: UUID
    private let getWorkoutSessionById: GetWorkoutSessionById
    
    var session: WorkoutSession?
    var isLoading = false
    var errorMessage: String?

    var exercises: [Exercise] {
        session?.exercises ?? []
    }

    init(sessionId: UUID, getWorkoutSessionById: GetWorkoutSessionById) {
        self.sessionId = sessionId
        self.getWorkoutSessionById = getWorkoutSessionById
    }
    
    func load() {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        session = getWorkoutSessionById.execute(id: sessionId)
    }

    
}
