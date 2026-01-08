//
//  ShowWorkoutTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import SwiftUI

struct WorkoutCard: View {
    let title: String
    let count: Int
    let imageName: String
    let gradientColors: [Color]

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 18)
                .fill(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            Image(imageName)
                .resizable()
                .scaledToFill()
                .opacity(0.30)
                .blendMode(.overlay)
                .clipped()
            

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text("\(count) exercises")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
        .aspectRatio(1, contentMode: .fit)
    }
}


struct WorkoutGrid: View{
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: 14),
                GridItem(.flexible(), spacing: 14)
            ],
            spacing: 14
        ) {
            WorkoutCard(
                title: "Full Body Strength",
                count: 3,
                imageName: "template1",
                gradientColors: [Color.red, Color.orange]
            )

            WorkoutCard(
                title: "Chest Day",
                count: 2,
                imageName: "template2",
                gradientColors: [Color.red, Color.orange]
            )
            
        }
    }
}

#Preview {
    WorkoutGrid()
}
