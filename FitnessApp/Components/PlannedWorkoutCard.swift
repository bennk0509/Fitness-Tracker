//
//  PlannedWorkoutCard.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//


import SwiftUI

struct PlannedWorkoutCard: View {
    
    let title: String
    let accentColor: Color
    let location: String
    let duration: String
    let difficulty: String
    let schedule: String
    let exercises: [String]
    let totalExercises: Int
    let calories: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
            
            HStack(spacing: 6) {
                Image(systemName: "location.fill")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text(location)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            
            
            HStack(spacing: 6) {
                Image(systemName: "clock")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text(schedule)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            HStack(spacing: 4) {
                Image(systemName: "dumbbell")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("\(totalExercises) exercises")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            HStack(spacing: 4) {
                Image(systemName: "dumbbell")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("\(totalExercises) exercises")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            HStack(spacing: 4) {
                Image(systemName: "dumbbell")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("\(totalExercises) exercises")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("DarkGray").opacity(0.95))
        .cornerRadius(16)
    }
}
