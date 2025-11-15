//
//  FitnessRing.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

//extension Color {
//    static let appleMove = Color(red: 1.0, green: 0.27, blue: 0.23)      // bright red
//    static let appleExercise = Color(red: 0.40, green: 0.80, blue: 0.20) // neon green
//    static let appleStand = Color(red: 0.23, green: 0.70, blue: 1.0)     // cyan/blue
//}

struct AppleFitnessRing: View {
    @Binding var progress: CGFloat
    @Binding var goal: Int
    var color: Color
    var thickness: CGFloat = 20

    var body: some View {
        ZStack {
            // Background track
            Circle()
                .stroke(
                    color.opacity(0.3),
                    style: StrokeStyle(lineWidth: thickness)
                )

            Circle()
                .trim(from: 0.0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(
                    color,
//                    AngularGradient(
//                        gradient: Gradient(colors: [
//                            color.opacity(0.8),
//                            color,
//                            color.opacity(0.9)
//                        ]),
//                        center: .center
//                    ),
                    style: StrokeStyle(
                        lineWidth: thickness,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .shadow(radius: 6)
        }
        .animation(.easeOut(duration: 1.0), value: progress)
    }
}


struct AppleFitnessRings: View {
    @Binding var move: Int
    @Binding var exercise: Int
    @Binding var stand: Int

    @Binding var moveGoal: Int
    @Binding var exerciseGoal: Int
    @Binding var standGoal: Int

    var body: some View {
        ZStack {
            AppleFitnessRing(
                progress: .constant(CGFloat(move)),
                goal: $moveGoal,
                color: .red,
            )
            .frame(width: 150, height: 150)

            AppleFitnessRing(
                progress: .constant(CGFloat(exercise)),
                goal: $exerciseGoal,
                color: .green,
            )
            .frame(width: 110, height: 110)

            AppleFitnessRing(
                progress: .constant(CGFloat(stand)),
                goal: $standGoal,
                color: .blue,
            )
            .frame(width: 70, height: 70)
        }
    }
}

