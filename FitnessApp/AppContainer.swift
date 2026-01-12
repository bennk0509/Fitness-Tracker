//
//  AppContainer.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI

@Observable
final class AppContainer {

    let workoutSessionRepo: WorkoutSessionRepository
    let workoutTemplateRepo: WorkoutTemplateRepository
    let exerciseTemplateRepo: ExerciseTemplateRepository
    let activityRepo: ActivityRepository

    let getAllWorkouts: GetAllWorkouts
    let getDailyActivity: GetDailyActivity
    let getAllWorkoutTemplate: GetAllWorkoutTemplate
    let getWorkoutSessionById: GetWorkoutSessionById
    let getAllExerciseTemplate: GetAllExerciseTemplate
    let createWorkoutSessionFromTemplate: CreateWorkoutSessionFromTemplate
    let createWorkoutSessionNotFromTemplate: CreateWorkoutSessionNotFromTemplate

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
        WorkoutTrackingViewModel(
            sessionId: sessionId,
            getWorkoutSessionById: getWorkoutSessionById,
            getAllExerciseTemplate: getAllExerciseTemplate
        )
    }
}
