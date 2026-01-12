//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI
import CoreData

@main
struct FitnessAppApp: App {
    let persistenceController = PersistenceController.shared

    @State private var container = AppContainer(
        workoutSessionRepo: MockUpWorkoutRepository(),
        workoutTemplateRepo: MockupWorkoutTemplateRepository(),
        exerciseTemplateRepo: MockupExerciseTemplateRepository(),
        activityRepo: MockupActivityRepository()
    )

    var body: some Scene {
        WindowGroup {
            FitnessTabView()
                .environment(container)
                .whiteText()
        }
    }
}
