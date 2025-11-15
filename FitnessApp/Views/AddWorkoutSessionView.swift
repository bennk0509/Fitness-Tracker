//
//  AddWorkoutSessionView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct SetUIModel: Identifiable {
    let id = UUID()
    let setNumber: Int
    let reps: String
    let weight: String
    let rest: String
}


struct WorkoutTrackingView: View {
    @State private var timer: String = "00:00:00"
    private let sets = [
        SetUIModel(setNumber: 1, reps: "12", weight: "40kg", rest: "90s"),
        SetUIModel(setNumber: 2, reps: "10", weight: "45kg", rest: "120s"),
        SetUIModel(setNumber: 3, reps: "8",  weight: "50kg", rest: "120s")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                HStack(spacing: 14) {

                    Image(systemName: "figure.strengthtraining.traditional")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(12)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(Circle())

                    Text("Physical Training")
                        .font(.system(size: 18, weight: .semibold))

                    Spacer()
                    
                    Button(action: {
                            print("More tapped")
                        }) {
                            Image(systemName: "ellipsis")
                                .font(.title3)
                                .rotationEffect(.degrees(90)) // make it vertical (⋮)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 4)
                        }
                    
                }
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(sets) { set in
                        HStack {
                            Text("\(set.setNumber)")
                                .frame(width: 60, alignment: .leading)
                                .font(.system(size: 16, weight: .semibold))

                            Spacer()

                            Text("\(set.reps) reps")
                                .font(.system(size: 16))
                                .foregroundColor(.primary)

                            Text("•")
                                .font(.system(size: 16))
                                .opacity(0.3)

                            Text(set.weight)
                                .font(.system(size: 16))
                                .foregroundColor(.primary)

                            Text("•")
                                .font(.system(size: 16))
                                .opacity(0.3)

                            Text("Rest: \(set.rest)")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            bottomWorkoutControls
        }
    }
    
    var bottomWorkoutControls: some View {
        HStack {
            Text(String(format: timer))
                .font(.system(size: 34, weight: .medium))
                .monospacedDigit()
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
        .padding()
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

#Preview {
    WorkoutTrackingView()
}
