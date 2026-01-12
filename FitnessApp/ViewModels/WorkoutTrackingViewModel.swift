//
//  WorkoutTrackingViewModel.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-06.
//

import SwiftUI

struct WorkoutTrackingUseCases {
    let getWorkoutSessionById: GetWorkoutSessionById
    let getAllExerciseTemplate: GetAllExerciseTemplate

    let addSetToExercise: AddSetToExercise
    let deleteSetFromExercise: DeleteSetFromExercise
    let updateSetWeight: UpdateSetWeight
    let updateSetReps: UpdateSetReps

    let addExerciseFromTemplate: AddExerciseFromTemplate
    let deleteExerciseFromSession: DeleteExerciseFromSession

    let finishWorkoutSession: FinishWorkoutSession
}

struct ExercisesLibSheet: Identifiable { let id = UUID() }
struct ExerciseDetailSheet: Identifiable {
    let exerciseId: UUID
    var id: UUID { exerciseId }
}


@Observable
class WorkoutTrackingViewModel{
    let sessionId: UUID
    private let useCases: WorkoutTrackingUseCases
    
    init(sessionId: UUID, useCases: WorkoutTrackingUseCases) {
        self.sessionId = sessionId
        self.useCases = useCases
    }
    
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

    

    var showExercisesLib: ExercisesLibSheet? = nil

    var exerciseTemplates: [ExerciseTemplate] = []
    
    
    var elapsedSeconds: Int = 0
    private var timerTask: Task<Void, Never>? = nil
    private var startDate: Date? = nil
    
    var isPaused = false
    var confirmFinish = false
    
    var exerciseDetailSheet: ExerciseDetailSheet? = nil
    
    var elapsedText: String {
        let m = elapsedSeconds / 60
        let s = elapsedSeconds % 60
        return String(format: "%02d:%02d", m, s)
    }

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
    
    func loadExerciseTemplate(){
        guard exerciseTemplates.isEmpty else { return }
        do {
            exerciseTemplates = try useCases.getAllExerciseTemplate.execute()
        } catch {
            errorMessage = String(describing: error)
        }
    }
    
    func load() {
            isLoading = true
            errorMessage = nil
            defer { isLoading = false }
            do {
                session = try useCases.getWorkoutSessionById.execute(id: sessionId)
                startWorkoutTimer()
            } catch {
                session = nil
                errorMessage = String(describing: error)
                stopWorkoutTimer()
            }
        }

    
    
    func addSet(exerciseID: UUID)
    {
        do {
            session = try useCases.addSetToExercise.execute(sessionId: sessionId, exerciseId: exerciseID)
        } catch {
            errorMessage = String(describing: error)
        }
    }
    
    
    func deleteSet(exerciseId: UUID, setId: UUID) {
        do {
            session = try useCases.deleteSetFromExercise.execute(
                sessionId: sessionId,
                exerciseId: exerciseId,
                setId: setId
            )
        } catch {
            errorMessage = String(describing: error)
        }
    }

    func updateWeight(exerciseId: UUID, setId: UUID, value: Double) {
        do {
            session = try useCases.updateSetWeight.execute(
                sessionId: sessionId,
                exerciseId: exerciseId,
                setId: setId,
                weight: value
            )
        } catch {
            errorMessage = String(describing: error)
        }
    }

    func updateReps(exerciseId: UUID, setId: UUID, value: Int) {
        do {
            session = try useCases.updateSetReps.execute(
                sessionId: sessionId,
                exerciseId: exerciseId,
                setId: setId,
                reps: value
            )
        } catch {
            errorMessage = String(describing: error)
        }
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
        do {
            session = try useCases.addExerciseFromTemplate.execute(sessionId: sessionId, template: template)
        } catch {
            errorMessage = String(describing: error)
        }
    }
    func deleteExercise(exerciseId: UUID) {
        do {
            session = try useCases.deleteExerciseFromSession.execute(sessionId: sessionId, exerciseId: exerciseId)
        } catch {
            errorMessage = String(describing: error)
        }
    }
    
    func clickAddNewExercise(){
        showExercisesLib = ExercisesLibSheet()
        loadExerciseTemplate()
    }

    func finishWorkout() {
        stopWorkoutTimer()
        clearRest()

        do {
            session = try useCases.finishWorkoutSession.execute(sessionId: sessionId, durationSeconds: elapsedSeconds)
        } catch {
            errorMessage = String(describing: error)
        }
    }
    
    func openExerciseDetail(exerciseId: UUID) {
        exerciseDetailSheet = ExerciseDetailSheet(exerciseId: exerciseId)
    }

    func closeExerciseDetail() {
        exerciseDetailSheet = nil
    }



}
