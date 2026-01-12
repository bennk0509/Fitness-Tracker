//
//  FitnessTabView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI


import SwiftUI

struct FitnessTabView: View {
    @Environment(AppContainer.self) private var container

    var body: some View {
        TabView {

            NavigationStack {
                HomeView(vm: container.makeHomeVM())
            }
            .tabItem { Label("Home", systemImage: "house.fill") }

            NavigationStack { PlanView() }
                .tabItem { Label("Plan", systemImage: "calendar") }

            NavigationStack {
                PreWorkoutView(
                    vm: container.makeCreateSessionVM(),
                    makeTrackingVM: { id in container.makeTrackingVM(sessionId: id) }
                )
            }
            .tabItem { Label("Start", systemImage: "play.circle.fill") }

            NavigationStack { Text("Account") }
                .tabItem { Label("Account", systemImage: "person.crop.circle") }

            NavigationStack { Text("ABSC") }
                .tabItem { Label("Analysis", systemImage: "chart.bar.xaxis") }
        }
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    // Preview cần inject container
    FitnessTabView()
        .environment(
            AppContainer(
                workoutSessionRepo: MockUpWorkoutRepository(),
                workoutTemplateRepo: MockupWorkoutTemplateRepository(),
                exerciseTemplateRepo: MockupExerciseTemplateRepository(),
                activityRepo: MockupActivityRepository()
            )
        )
}
