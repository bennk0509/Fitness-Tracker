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
                    HomeView(workoutRepository: MockUpWorkoutRepository(), activityRepository: MockupActivityRepository())
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    
                    PlanView()
                        .tabItem {
                            Label("Plan", systemImage: "calendar")
                        }
                    
                    Text("Account")
                        .tabItem {
                            Label("Account", systemImage: "person.crop.circle")
                        }
                    Text("Plan")
                        .tabItem {
                            Label("Analysis", systemImage: "chart.bar.xaxis")
                        }
                }

                Button {
                    goToAddSession = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .padding(.trailing, 24)
                .padding(.bottom, 40)
            }
            .navigationDestination(isPresented: $goToAddSession) {
                AddWorkoutSessionView()
            }
        }

    }
}



#Preview {
    FitnessTabView()
}
