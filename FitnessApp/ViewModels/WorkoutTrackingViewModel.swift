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
    private let getAllExerciseTemplate: GetAllExerciseTemplate
    
    var session: WorkoutSession?
    var isLoading = false
    var errorMessage: String?

    var exercises: [Exercise] {
        session?.exercises ?? []
    }
    
    var showRestPicker = false
    var restByExercise: [UUID: Int] = [:]
    var editingRestExerciseId: UUID? = nil
    
    var restRequest: RestRequest? = nil

    struct ExercisesLibSheet: Identifiable { let id = UUID() }

    var showExercisesLib: ExercisesLibSheet? = nil

    var exerciseTemplates: [ExerciseTemplate] = []
    
    
    var elapsedSeconds: Int = 0
    private var timerTask: Task<Void, Never>? = nil
    private var startDate: Date? = nil
    
    var isPaused = false
    var confirmFinish = false

    func restSeconds(for exerciseId: UUID) -> Int {
        restByExercise[exerciseId] ?? 0
    }

    func setRestSeconds(_ seconds: Int, for exerciseId: UUID) {
        restByExercise[exerciseId] = max(0, seconds)
    }
    
    func togglePause() {
        isPaused.toggle()
        if isPaused { stopWorkoutTimer() }
        else { startWorkoutTimer() } // hoặc startWorkoutTimer() kiểu resume
    }

    func startWorkoutTimer() {
        // tránh start nhiều lần
        if timerTask != nil { return }

        startDate = Date()
        elapsedSeconds = 0

        timerTask = Task { [weak self] in
            guard let self else { return }
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 1_000_000_000) // 1s
                guard let start = self.startDate else { continue }
                self.elapsedSeconds = Int(Date().timeIntervalSince(start))
            }
        }
    }

    func stopWorkoutTimer() {
        timerTask?.cancel()
        timerTask = nil
    }

    var elapsedText: String {
        let m = elapsedSeconds / 60
        let s = elapsedSeconds % 60
        return String(format: "%02d:%02d", m, s)
    }

    
    func loadExerciseTemplate(){
        if !exerciseTemplates.isEmpty {
            return
        }
        exerciseTemplates = getAllExerciseTemplate.execute()
    }
    
    init(sessionId: UUID, getWorkoutSessionById: GetWorkoutSessionById, getAllExerciseTemplate: GetAllExerciseTemplate) {
        self.sessionId = sessionId
        self.getWorkoutSessionById = getWorkoutSessionById
        self.getAllExerciseTemplate = getAllExerciseTemplate
    }
    
    func load() {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        session = getWorkoutSessionById.execute(id: sessionId)
        startWorkoutTimer()
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
    
    func finishSet(exerciseId: UUID, setId: UUID) {
        let seconds = restSeconds(for: exerciseId)
        guard seconds > 0 else { return }
        restRequest = RestRequest(seconds: seconds, exerciseId: exerciseId, setId: setId)
    }

    func clearRest(){
        restRequest = nil
    }
    
    func addExercise(from template: ExerciseTemplate) {
        guard var s = session else { return }
        let new_exercise = template.toExercise()
        s.exercises.append(new_exercise)
        session = s
    }
    
    func clickAddNewExercise(){
        showExercisesLib = ExercisesLibSheet()
        loadExerciseTemplate()
    }
    
    
    func finishWorkout(){
        stopWorkoutTimer()
        clearRest()
        
        guard var s = session else { return }
        
//        s.endedAt = Date()
//        s.durationSeconds = elapsedSeconds
//        s.status = .completed
//        
    
//        name: String,
//        duration: Int = 0,
//        calories: Int = 0,
//        date: Date = Date(),
//        intensity: String? = nil,
//        exercises: [Exercise] = [],
//        templateID: UUID? = nil)
//        session = s

        // TODO: gọi usecase để lưu DB
        // finishWorkoutSession.execute(session: s)

        // TODO: navigate / show summary
        // showSummary = s
    }
    
    
    struct ExerciseDetailSheet: Identifiable {
            let exerciseId: UUID
            var id: UUID { exerciseId }   // stable id
        }

        var exerciseDetailSheet: ExerciseDetailSheet? = nil

        func openExerciseDetail(exerciseId: UUID) {
            exerciseDetailSheet = ExerciseDetailSheet(exerciseId: exerciseId)
        }

        func closeExerciseDetail() {
            exerciseDetailSheet = nil
        }

        func deleteExercise(exerciseId: UUID) {
            guard var s = session else { return }
            s.exercises.removeAll { $0.id == exerciseId }
            session = s
            // TODO persist via usecase/repo
        }

}
