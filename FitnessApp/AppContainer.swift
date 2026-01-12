//
//  AppContainer.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI
import SwiftUI

@Observable
final class AppContainer {

    // Repos
    let workoutSessionRepo: WorkoutSessionRepository
    let workoutTemplateRepo: WorkoutTemplateRepository
    let exerciseTemplateRepo: ExerciseTemplateRepository
    let activityRepo: ActivityRepository

    // Shared usecases (home/create...)
    let getAllWorkouts: GetAllWorkouts
    let getDailyActivity: GetDailyActivity
    let getAllWorkoutTemplate: GetAllWorkoutTemplate
    let getWorkoutSessionById: GetWorkoutSessionById
    let getAllExerciseTemplate: GetAllExerciseTemplate
    let createWorkoutSessionFromTemplate: CreateWorkoutSessionFromTemplate
    let createWorkoutSessionNotFromTemplate: CreateWorkoutSessionNotFromTemplate
    let trackingUseCases: WorkoutTrackingUseCases

    init(
        workoutSessionRepo: WorkoutSessionRepository,
        workoutTemplateRepo: WorkoutTemplateRepository,
        exerciseTemplateRepo: ExerciseTemplateRepository,
        activityRepo: ActivityRepository
    ) {
        self.workoutSessionRepo = workoutSessionRepo
        self.workoutTemplateRepo = workoutTemplateRepo
        self.exerciseTemplateRepo = exerciseTemplateRepo
        self.activityRepo = activityRepo

        // Base usecases
        self.getAllWorkouts = GetAllWorkouts(repository: workoutSessionRepo)
        self.getDailyActivity = GetDailyActivity(repository: activityRepo)
        self.getAllWorkoutTemplate = GetAllWorkoutTemplate(repository: workoutTemplateRepo)
        self.getWorkoutSessionById = GetWorkoutSessionById(repository: workoutSessionRepo)
        self.getAllExerciseTemplate = GetAllExerciseTemplate(repository: exerciseTemplateRepo)

        self.createWorkoutSessionFromTemplate = CreateWorkoutSessionFromTemplate(
            workoutSessionRepository: workoutSessionRepo,
            workoutTemplateRepository: workoutTemplateRepo
        )
        self.createWorkoutSessionNotFromTemplate = CreateWorkoutSessionNotFromTemplate(
            workoutSessionRepository: workoutSessionRepo,
            workoutTemplateRepository: workoutTemplateRepo
        )

        self.trackingUseCases = WorkoutTrackingUseCases(
            getWorkoutSessionById: self.getWorkoutSessionById,
            getAllExerciseTemplate: self.getAllExerciseTemplate,
            addSetToExercise: AddSetToExercise(workoutSessionRepository: workoutSessionRepo),
            deleteSetFromExercise: DeleteSetFromExercise(workoutSessionRepository: workoutSessionRepo),
            updateSetWeight: UpdateSetWeight(repo: workoutSessionRepo),
            updateSetReps: UpdateSetReps(repo: workoutSessionRepo),
            addExerciseFromTemplate: AddExerciseFromTemplate(repo: workoutSessionRepo),
            deleteExerciseFromSession: DeleteExerciseFromSession(repo: workoutSessionRepo),
            finishWorkoutSession: FinishWorkoutSession(repo: workoutSessionRepo)
        )
    }

    func makeHomeVM() -> HomeViewModel {
        HomeViewModel(getAllWorkouts: getAllWorkouts, getDailyActivity: getDailyActivity)
    }

    func makeCreateSessionVM() -> CreateWorkoutSessionViewModel {
        CreateWorkoutSessionViewModel(
            createWorkoutSessionFromTemplate: createWorkoutSessionFromTemplate,
            createWorkoutSessionNotFromTemplate: createWorkoutSessionNotFromTemplate,
            getAllWorkoutTemplate: getAllWorkoutTemplate
        )
    }

    func makeTrackingVM(sessionId: UUID) -> WorkoutTrackingViewModel {
        WorkoutTrackingViewModel(sessionId: sessionId, useCases: trackingUseCases)
    }
}
