//
//  SampleData.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import Foundation

let sampleWorkouts: [WorkoutSession] = [
    WorkoutSession(
        name: "Full Body Strength",
        duration: 25,
        calories: 240,
        date: Date(),
        intensity: "Intermediate"
    ),
    WorkoutSession(
        name: "HIIT 10-Min Blast",
        duration: 10,
        calories: 150,
        date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
        intensity: "Intense"
    ),
    WorkoutSession(
        name: "Yoga Flow",
        duration: 20,
        calories: 90,
        date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
        intensity: "Light"
    )
]

var todayActivity: Activity {
    let steps: Int = 12000
    let calories: Int = 1200
    let exercise: Int = 60
    return Activity(steps: steps, calories: calories, exercise: exercise)
}

// MARK: - Sample Exercises
let sampleExercises: [Exercise] = [
    Exercise(
        name: "Bench Press (Barbell)",
        sets: [
            SetLog(setNumber: 1, weight: 40, reps: 12, rest: 90),
            SetLog(setNumber: 2, weight: 45, reps: 10, rest: 120),
            SetLog(setNumber: 3, weight: 50, reps: 8, rest: 120 )
        ],
        templateID: nil
    ),
    
    Exercise(
        name: "Lat Pulldown (Machine)",
        sets: [            
            SetLog(setNumber: 1, weight: 55, reps: 10, rest: 90),
            SetLog(setNumber: 2, weight: 60, reps: 8, rest: 120)
        ],
        templateID: nil
    )
]

let sampleWorkoutTemplates: [WorkoutTemplate] = [
    WorkoutTemplate(
            name: "Full Body Strength",
            defaultExercises: [
                ExerciseTemplate(
                    id: UUID(),
                    name: "Bench Press",
                    defaultSets: [
                        SetLog(setNumber: 1, weight: 40, reps: 12, rest: 90),
                        SetLog(setNumber: 2, weight: 45, reps: 10, rest: 120),
                        SetLog(setNumber: 3, weight: 50, reps: 8,  rest: 120)
                    ]
                ),
                ExerciseTemplate(
                    id: UUID(),
                    name: "Lat Pulldown",
                    defaultSets: [
                        SetLog(setNumber: 1, weight: 55, reps: 10, rest: 90),
                        SetLog(setNumber: 2, weight: 60, reps: 8,  rest: 120)
                    ]
                )
            ]
        ),
    WorkoutTemplate(
            name: "Yoga Flexibility Flow",
            defaultExercises: [
                ExerciseTemplate(
                    id: UUID(),
                    name: "Squat",
                    defaultSets: [
                        SetLog(setNumber: 1, weight: 8, reps: 10, rest: 20),
                        SetLog(setNumber: 2, weight: 8, reps: 70, rest: 10)
                    ]
                ),
                ExerciseTemplate(
                    id: UUID(),
                    name: "Deadlift",
                    defaultSets: [
                        SetLog(setNumber: 1, weight: 8, reps: 10, rest: 20),
                        SetLog(setNumber: 2, weight: 8, reps: 70, rest: 10)
                    ]
                )
            ]
        ),
    WorkoutTemplate(
        name: "Yoga Flexibility Flow",
        defaultExercises: [
            ExerciseTemplate(
                id: UUID(),
                name: "Squat",
                defaultSets: [
                    SetLog(setNumber: 1, weight: 8, reps: 10, rest: 20),
                    SetLog(setNumber: 2, weight: 8, reps: 70, rest: 10)
                ]
            ),
            ExerciseTemplate(
                id: UUID(),
                name: "Deadlift",
                defaultSets: [
                    SetLog(setNumber: 1, weight: 8, reps: 10, rest: 20),
                    SetLog(setNumber: 2, weight: 8, reps: 70, rest: 10)
                ]
            )
        ]
    )
]


let sampleExerciseTemplates: [ExerciseTemplate] = [
    ExerciseTemplate(
        id: UUID(),
        name: "Squat",
        defaultSets: [
            SetLog(setNumber: 1, weight: 8, reps: 10, rest: 20),
            SetLog(setNumber: 2, weight: 8, reps: 70, rest: 10)
        ]
    ),
    ExerciseTemplate(
        id: UUID(),
        name: "Deadlift",
        defaultSets: [
            SetLog(setNumber: 1, weight: 8, reps: 10, rest: 20),
            SetLog(setNumber: 2, weight: 8, reps: 70, rest: 10)
        ]
    )
]
