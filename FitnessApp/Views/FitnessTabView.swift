//
//  FitnessTabView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI


struct FitnessTabView: View {

    @State private var goToAddSession = false

    var body: some View {

        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.black
                    .ignoresSafeArea()
                
                TabView {
                    HomeView(
                        vm: HomeViewModel(getAllWorkouts: GetAllWorkouts(repository: MockUpWorkoutRepository()), getDailyActivity: GetDailyActivity(repository: MockupActivityRepository()))
                    )
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    
                    PlanView()
                        .tabItem {
                            Label("Plan", systemImage: "calendar")
                        }
                    
                    Text("Start Workout")
                        .tabItem {
                            Label("Start", systemImage: "person.crop.circle")
                    }
                    
                    Text("Account")
                        .tabItem {
                            Label("Account", systemImage: "person.crop.circle")
                        }
                    PreWorkoutView(
                        vm: CreateWorkoutSessionViewModel(
                            createWorkoutSessionFromTemplate:
                                CreateWorkoutSessionFromTemplate(workoutSessionRepository: MockUpWorkoutRepository(), workoutTemplateRepository: MockupWorkoutTemplateRepository()),
                            createWorkoutSessionNotFromTemplate:
                                CreateWorkoutSessionNotFromTemplate(workoutSessionRepository: MockUpWorkoutRepository(), workoutTemplateRepository: MockupWorkoutTemplateRepository()),
                            getAllWorkoutTemplate:
                                GetAllWorkoutTemplate(repository: MockupWorkoutTemplateRepository())),
                        makeTrackingVM: { sessionID in
                                WorkoutTrackingViewModel(
                                    sessionId: sessionID,
                                    getWorkoutSessionById: GetWorkoutSessionById(repository: MockUpWorkoutRepository()),
                                    getAllExerciseTemplate:
                                        GetAllExerciseTemplate(repository: MockupExerciseTemplateRepository())
                                )
                            }
                    )
                    .tabItem {
                        Label("Analysis", systemImage: "chart.bar.xaxis")
                    }
                }

                Button {

                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .padding(.trailing, 20)
                .padding(.bottom, 60)
            }
        }

    }
}



#Preview {
    FitnessTabView()
}
