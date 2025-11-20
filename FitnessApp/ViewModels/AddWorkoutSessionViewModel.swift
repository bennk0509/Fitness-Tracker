//
//  AddWorkoutSessionViewModel.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-19.
//


import SwiftUI

struct Set: Identifiable, Hashable {
    let id = UUID()
    let setNumber: Int
    let reps: String
    let weight: String
    let rest: String
}

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let rest: String
    var sets: [Set]
}

@Observable
class AddWorkoutSessionViewModel {
    var exercises: [Exercise] = [
            Exercise(
                name: "Bench Press (Barbell)",
                rest: "3:00",
                sets: [
                    Set(setNumber: 1, reps: "12", weight: "40", rest: "90"),
                    Set(setNumber: 2, reps: "10", weight: "45", rest: "120"),
                    Set(setNumber: 3, reps: "8",  weight: "50", rest: "120")
                ]
            ),
            Exercise(
                name: "Lat Pulldown (Machine)",
                rest: "2:30",
                sets: [
                    Set(setNumber: 1, reps: "10", weight: "55", rest: "90"),
                    Set(setNumber: 2, reps: "8",  weight: "60", rest: "120")
                ]
            )
        ]
    
    func addSet(to exerciseID: UUID) {
            guard let index = exercises.firstIndex(where: { $0.id == exerciseID }) else { return }

            let nextNumber = (exercises[index].sets.last?.setNumber ?? 0) + 1
            
            let newSet = Set(
                setNumber: nextNumber,
                reps: "10",
                weight: "40",
                rest: "90s"
            )
            
            exercises[index].sets.append(newSet)
        }
}
