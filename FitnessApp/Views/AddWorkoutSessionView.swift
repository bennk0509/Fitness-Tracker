//
//  AddWorkoutSessionView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct AddWorkoutSessionView: View {
    @State private var vm = AddWorkoutSessionViewModel()
    
    @State private var timer: String = "00:00:00"
    @State private var showRestSheet = true
    @State private var restMinutes = 3
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(vm.exercises) { exercise in
                        ExerciseCardView(exercise: exercise) {
                            vm.addSet(to: exercise.id)
                        }
                    }
                    
                    Button {
                        print("Add new workout tapped")
                    } label: {
                        Text("Add New Workout")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(
                                Capsule().fill(Color.gray.opacity(0.1))
                            )
                    }
                }
                .padding()
            }
//            BottomSheetView(
//                isOpen: $showRestSheet,
//                maxHeight: 360
//            ) {
//                RestTimerView(isShown: $showRestSheet, minutes: $restMinutes)
//            }
        }
        .foregroundColor(.white)
//        .safeAreaInset(edge: .bottom) {
//            bottomWorkoutControls
//        }
    }
    var bottomWorkoutControls: some View {
            HStack {
                Text(String(format: timer))
                    .font(.system(size: 34, weight: .medium))
                Spacer()
                HStack(spacing: 20){
                    Button(action: {
                        print("Stop tapped")
                    }) {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "pause.fill")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            )
                    }
                    Button(action: {
                        print("End tapped")
                    }) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "xmark")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            )
                    }
                }
    
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
}

#Preview {
    AddWorkoutSessionView()
}
