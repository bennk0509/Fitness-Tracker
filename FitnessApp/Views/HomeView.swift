//
//  HomeView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct HomeView: View {
    @State var vm = HomeViewModel();
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                HStack{
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        Text("Welcome back").font(.system(size: 18))
                        Text("Khanh Nguyen").font(.system(size: 24, weight: .bold))
                    }
                    Spacer()
                }
                VStack(alignment:.leading){
                    Text("Activity").font(.system(size: 18, weight: .bold))
                    HStack{
                        StatFitnessCard(iconName: "figure.walk", number: $vm.move, text: "Steps", color: .orange)
                        StatFitnessCard(iconName: "flame.fill", number: $vm.caloriesBurned, text: "Cal Out", unit: "Kcal", color: .green)
                        StatFitnessCard(iconName: "figure.strengthtraining.traditional", number: $vm.exercise, text: "Exercise", unit: "min", color: .blue)
                    }
                }
                
                VStack(alignment:.leading){
                    HStack{
                        Text("Recent Workout").font(.system(size: 18, weight: .bold))
                        Spacer()
                        Text("Show All").font(.system(size: 12, weight: .semibold)).foregroundColor(.secondary)
                    }
                    
                    LazyVStack(spacing: 10) {
                        ForEach(vm.workouts) { workout in
                            WorkoutRow(workout: workout)
                        }
                    }
                    .padding(.horizontal,5)
                }
            }.frame(maxWidth: .infinity)
                .padding(20)
        }.background(.white)
    }
}

#Preview {
    HomeView()
}
