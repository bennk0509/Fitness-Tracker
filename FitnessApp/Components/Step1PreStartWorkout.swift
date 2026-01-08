//
//  Step1PreStartWorkout.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//


import SwiftUI

struct Step1PreStartWorkout: View {
    @State private var selected: Int? = nil
    @Binding var currentStep: Int
    @Binding var isTemplate: Bool
    var body: some View {
        VStack(spacing: 40) {
            // TITLE
            VStack(spacing: 6) {
                Text("Start New Workout")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Choose how you want to begin")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
            }
            .padding(.top, 40)
            
            VStack(spacing: 20){
                VStack(spacing: 10) {
                    Button {
                       selected = 1
                        currentStep = 2
                        isTemplate = true
                    } label: {
                        HStack(spacing: 20){
                            Image(systemName: "dumbbell.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .frame(maxHeight: .infinity)
                            VStack(alignment:.leading, spacing: 10){
                                Text("Recommend Workout")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("Choose your workout based on your fitness level and goals")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    }.frame(height: 80)
                        .padding()
                        .padding(.horizontal,10)
                        .background(Color("DarkGray"))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(selected == 1 ? Color.white : Color.clear, lineWidth: 3)
                        )
                }
                
                VStack(spacing: 10) {
                    Button {
                        selected = 2
                        currentStep = 2
                        isTemplate = false
                    } label: {
                        HStack(spacing: 20){
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .foregroundColor(.white)
                                .frame(maxHeight: .infinity)
                            VStack(alignment:.leading, spacing: 10){
                                Text("Start your workout")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("Choose your workout based on your fitness level and goals")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    }.frame(height: 80)
                        .padding()
                        .padding(.horizontal,10)
                        .background(Color("DarkGray"))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(selected == 2 ? Color.white : Color.clear, lineWidth: 3)
                        )
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
