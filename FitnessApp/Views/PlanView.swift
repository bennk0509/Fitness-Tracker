//
//  PlanView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import SwiftUI

struct PlanView: View {


    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                CalendarHorizontal()
                
                HStack{
                    VStack(alignment:.leading,spacing: 10){
                        Text("Training day")
                            .font(.system(size: 18, weight: .bold))
                        Text("Location")
                        
                    }
                    Spacer()
                    Button {
                        print("Start")
                    } label: {
                        Text("Start")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: 100)
                            .background(
                                Capsule().fill(Color.gray.opacity(0.1))
                            )
                    }
                }
                .padding()
                .background(Color("DarkGray"))
                .cornerRadius(20)
                
                
                VStack(alignment:.leading){
                    HStack{
                        Text("Planned Workout")
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                    }
                    VStack(spacing:20){
                        HStack(spacing: 20) {
                            PlannedWorkoutCard(
                                title: "Push Day",
                                accentColor: .orange,
                                location: "Gym",
                                duration: "45 min",
                                difficulty: "Intermediate",
                                schedule: "Today at 6:00 PM",
                                exercises: ["Bench Press", "Incline DB Press", "Push-ups", "Cable Flys", "Tricep Pushdown"],
                                totalExercises: 6,
                                calories: 220
                            ).aspectRatio(1, contentMode: .fit)
                            
                            PlannedWorkoutCard(
                                title: "Leg Day",
                                accentColor: .pink,
                                location: "Gym",
                                duration: "55 min",
                                difficulty: "Advanced",
                                schedule: "Tomorrow morning",
                                exercises: ["Squats", "Leg Press", "Lunges", "RDL"],
                                totalExercises: 4,
                                calories: 300
                            ).aspectRatio(1, contentMode: .fit)
                            
                        }
                        HStack(spacing: 20) {
                            PlannedWorkoutCard(
                                title: "Push Day",
                                accentColor: .orange,
                                location: "Gym",
                                duration: "45 min",
                                difficulty: "Intermediate",
                                schedule: "Today at 6:00 PM",
                                exercises: ["Bench Press", "Incline DB Press", "Push-ups", "Cable Flys", "Tricep Pushdown"],
                                totalExercises: 6,
                                calories: 220
                            ).aspectRatio(1, contentMode: .fit)
                            
                            PlannedWorkoutCard(
                                title: "Leg Day",
                                accentColor: .pink,
                                location: "Gym",
                                duration: "55 min",
                                difficulty: "Advanced",
                                schedule: "Tomorrow morning",
                                exercises: ["Squats", "Leg Press", "Lunges", "RDL"],
                                totalExercises: 4,
                                calories: 300
                            ).aspectRatio(1, contentMode: .fit)
                            
                        }
                    }
                    
                    
                }.padding(.vertical)
                
                Spacer()
                
            }.padding(.horizontal)

        }.foregroundColor(.white)
    }
}

#Preview {
    PlanView()
}
