//
//  WorkoutRow.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct WorkoutRow: View {
    var workout: Workout

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            VStack(alignment: .leading, spacing: 6) {
                Text(workout.name)
                    .font(.headline)
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 6) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.orange)
                        Text("\(workout.calories)")
                            .font(.system(size: 15))
                        Text("kcal")
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                    }
                    HStack(spacing: 6) {
                        Image(systemName: "fitness.timer.fill")
                            .foregroundColor(.blue)
                        Text("\(workout.duration)")
                            .font(.system(size: 15))
                        Text("min")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 6) {
                        Image(systemName: "calendar")
                            .foregroundColor(.green)
                        Text(workout.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.system(size: 15)).foregroundColor(.gray)
                    }
                }


            }

            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}


#Preview {
    WorkoutRow(workout: sampleWorkouts[0]).padding()
}
