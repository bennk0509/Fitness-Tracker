//
//  HomeView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct HomeView: View {
    @State var vm: HomeViewModel;
    
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
                        CalendarHorizontal(selectedDate: Binding(
                            get: { vm.selectedDate },
                            set: { newDate in vm.selectDate(newDate) }
                        ))
                        
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
                        
                    }
                    
                    VStack(alignment:.leading){
                        HStack{
                            Text("Workout Templates").font(.system(size: 18, weight: .bold))
                            Spacer()
                            Text("Show All").font(.system(size: 12, weight: .semibold)).foregroundColor(.gray)
                        }
                        let columns = [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                        ]

                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(vm.workoutTemplates) { workout in
                                WorkoutRow(workout: workout)
                            }
                        }
                        .padding(.horizontal, 12)
                        
                    }
                }.frame(maxWidth: .infinity)
                    .padding(20)
            }
        }.foregroundColor(.white)
    }
}

#Preview {
    HomeView(
        vm: HomeViewModel(getAllWorkouts: GetAllWorkouts(repository:
                                                            MockUpWorkoutRepository()),
                          getDailyActivity: GetDailyActivity(repository:
                                                            MockupActivityRepository()),
                          getAllWorkoutTemplate: GetAllWorkoutTemplate(repository:
                                                            MockupWorkoutTemplateRepository()),
                         )
    )
}
