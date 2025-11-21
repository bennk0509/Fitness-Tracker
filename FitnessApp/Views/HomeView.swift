//
//  HomeView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct HomeView: View {
    @State private var vm: HomeViewModel;
    
    init(workoutRepository: WorkoutRepository,activityRepository: ActivityRepository ) {
        self._vm = State(
            initialValue: HomeViewModel(
                workoutRepository: workoutRepository,
                activityRepository: activityRepository
            )
        )
    }
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    HStack{
                        Text("Hey,").font(.system(size: 24, weight: .bold))
                        Text("Khanh Nguyen")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color("DarkGray"))
                        
                        Spacer()
                    }
                    VStack(alignment:.leading){
                        Text("Activity").font(.system(size: 18, weight: .bold))
                        HStack(spacing: 14){
                            StatFitnessCard(iconName: "figure.walk", number: $vm.dailyActivity.steps, text: "Steps")
                            StatFitnessCard(iconName: "flame.fill", number: $vm.dailyActivity.calories, text: "Cal Out", unit: "Kcal")
                            StatFitnessCard(iconName: "figure.strengthtraining.traditional", number: $vm.dailyActivity.exercise, text: "Exercise", unit: "min")
                        }
                    }
                    
                    VStack(alignment:.leading){
                        HStack{
                            Text("Recent Workout").font(.system(size: 18, weight: .bold))
                            Spacer()
                            Text("Show All").font(.system(size: 12, weight: .semibold)).foregroundColor(.gray)
                        }
                        
                        LazyVStack(spacing: 20) {
                            ForEach(vm.workouts) { workout in
                                WorkoutRow(workout: workout)
                            }
                        }
                        .padding(.horizontal,5)
                    }
                }.frame(maxWidth: .infinity)
                    .padding(20)
            }
        }.foregroundColor(.white)
    }
}

#Preview {
    HomeView(
        workoutRepository: MockUpWorkoutRepository(),
        activityRepository: MockupActivityRepository()
    )
}
