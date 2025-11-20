//
//  ExerciseCardView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import SwiftUI

struct ExerciseCardView: View {
    let exercise: Exercise
    let onAddSet: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {

            HStack {
                Text(exercise.name)
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.title3)
                    .rotationEffect(.degrees(90))
            }
            
            HStack {
                Text("\(exercise.rest) rest")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(20)
                    .frame(maxHeight: 40)
                    .background(Capsule().fill(Color.gray.opacity(0.1)))
                Spacer()
            }

            VStack(alignment: .leading, spacing: 10) {
                ForEach(exercise.sets) { set in
                    HStack {
                        VStack {
                            Text("Set")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.gray)
                            Text("\(set.setNumber)")
                                .font(.system(size: 16, weight: .semibold))
                                .padding()
                                .background(Circle().fill(Color.gray.opacity(0.1)))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Reps")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.gray)
                            Text(set.reps)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.vertical, 12)
                                .frame(maxWidth: 300, maxHeight: 40)
                                .background(Capsule().fill(Color.gray.opacity(0.1)))
                        }
                        
                        Spacer()
                        
                        // Weight
                        VStack {
                            Text("Weight")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.gray)
                            Text(set.weight)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.vertical, 12)
                                .frame(maxWidth: 300, maxHeight: 40)
                                .background(Capsule().fill(Color.gray.opacity(0.1)))
                        }
                    }
                }
            }
            
            HStack {
                Button(action: { onAddSet() }) {
                    Text("Add Set")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(Capsule().fill(Color.gray.opacity(0.1)))
                }
                Spacer()
            }
        }
    }
}
