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
    
    var showRestPicker = false
    var restMinutes = 0
    
    var restRequest: RestRequest? = nil

    
    
    
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

    
    func addSet(exerciseID: UUID)
    {
        guard var s = session else {return}
        guard let exIdx = s.exercises.firstIndex(where: {$0.id == exerciseID}) else {return}
        
        let setNumberNext = (s.exercises[exIdx].sets.map(\.setNumber).max() ?? 0) + 1
        let newSet = SetLog(id: UUID(), setNumber: setNumberNext, weight: 0, reps: 0, rest: 0)
        
        s.exercises[exIdx].sets.append(newSet)
        session = s
        
        //USECASE 2 REPOSITORY
    }
    
    
    func deleteSet(exerciseId: UUID, setId: UUID) {
        guard var s = session else { return }
        guard let exIdx = s.exercises.firstIndex(where: { $0.id == exerciseId }) else { return }

        s.exercises[exIdx].sets.removeAll { $0.id == setId }
        session = s
    }

    func updateWeight(exerciseId: UUID, setId: UUID, value: Double) {
        guard var s = session else { return }
        guard let exIdx = s.exercises.firstIndex(where: { $0.id == exerciseId }) else { return }
        guard let setIdx = s.exercises[exIdx].sets.firstIndex(where: { $0.id == setId }) else { return }

        s.exercises[exIdx].sets[setIdx].weight = value
        session = s
    }

    func updateReps(exerciseId: UUID, setId: UUID, value: Int) {
        guard var s = session else { return }
        guard let exIdx = s.exercises.firstIndex(where: { $0.id == exerciseId }) else { return }
        guard let setIdx = s.exercises[exIdx].sets.firstIndex(where: { $0.id == setId }) else { return }
        s.exercises[exIdx].sets[setIdx].reps = value
        session = s
    }
    
    func finishSet(exerciseId: UUID, setId: UUID)
    {
        
        let seconds = restMinutes
        guard seconds > 0 else {return}
        restRequest = RestRequest(seconds: seconds, exerciseId: exerciseId, setId: setId)
    }
    
    func clearRest(){
        restRequest = nil
    }
    
    func addExercise(){
        
    }
}
