//
//  WorkoutRow.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct WorkoutRow: View {
    var workout: WorkoutTemplate

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Header: Tên buổi tập + Một icon minh họa
            HStack {
                Text(workout.name)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            
            // Exercise List: Làm gọn lại
            VStack(alignment: .leading, spacing: 8) {
                // Chỉ hiển thị tối đa 3-4 bài tập để tránh làm Card quá dài
                ForEach(workout.defaultExercises.prefix(4)) { ex in
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(width: 4, height: 4)
                        
                        Text(ex.name)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                }
                
                // Nếu có nhiều hơn 4 bài, hiển thị dấu "..."
                if workout.defaultExercises.count > 4 {
                    Text("+ \(workout.defaultExercises.count - 4) more")
                        .font(.caption2)
                        .foregroundColor(.blue.opacity(0.8))
                        .padding(.leading, 12)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("DarkGray"))
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        )
    }
}

#Preview {
    WorkoutRow(workout: sampleWorkoutTemplates[0]).padding()
}
