
import Foundation

struct MockData {
    // 1. Danh sách bài tập gốc trong Library
    static let exercises: [Exercise] = [
            // 1. Chest - Barbell
            Exercise(
                name: "Bench Press",
                primaryMuscle: .chest,
                secondaryMuscles: [.triceps, .shoulders],
                instruction: "Lie on a flat bench, lower the bar to mid-chest, and press up.",
                equipment: .barbell
            ),
            
            // 2. Back - Bodyweight
            Exercise(
                name: "Pull Up",
                primaryMuscle: .back,
                secondaryMuscles: [.biceps],
                instruction: "Hang from a bar and pull your body up until your chin clears the bar.",
                equipment: .bodyweight
            ),
            
            // 3. Legs - Barbell
            Exercise(
                name: "Barbell Squat",
                primaryMuscle: .quads,
                secondaryMuscles: [.glutes, .hamstrings],
                instruction: "Rest bar on upper back, squat down until thighs are parallel to floor.",
                equipment: .barbell
            ),
            
            // 4. Shoulders - Dumbbell
            Exercise(
                name: "Dumbbell Lateral Raise",
                primaryMuscle: .shoulders,
                instruction: "Lift dumbbells out to your sides until arms are parallel to the floor.",
                equipment: .dumbbell
            ),
            
            // 5. Arms - Cable
            Exercise(
                name: "Tricep Pushdown",
                primaryMuscle: .triceps,
                instruction: "Push the cable bar down while keeping your elbows tucked to your sides.",
                equipment: .cable
            ),
            
            // 6. Abs - Bodyweight
            Exercise(
                name: "Plank",
                primaryMuscle: .abs,
                instruction: "Hold a push-up position but rest on your forearms instead of hands.",
                equipment: .bodyweight
            )
        ]

    // 2. Một Template mẫu (Giáo án Ngực)
    static let chestTemplate = Template(
        id: UUID(),
        name: "Chest Day Alpha",
        exercises: [
            WorkoutExercise(
                id: UUID(),
                exerciseId: exercises[0].id,
                exerciseName: exercises[0].name,
                sets: [
                    WorkoutSet(id: UUID(), weight: 60, reps: 10, isCompleted: false),
                    WorkoutSet(id: UUID(), weight: 60, reps: 10, isCompleted: false)
                ]
            ),
            WorkoutExercise(
                id: UUID(),
                exerciseId: exercises[2].id, // Push Up
                exerciseName: exercises[2].name,
                sets: [
                    WorkoutSet(id: UUID(), weight: 0, reps: 20, isCompleted: false)
                ]
            )
        ]
    )
}

extension MockData {
    // 3. Thông tin User mẫu
    static let user = User(
        id: UUID(),
        name: "Kiet Nguyen",
        dateOfBirth: Calendar.current.date(byAdding: .year, value: -20, to: Date()),
        gender: .male,
        unitSystem: .metric,
        weightHistory: [
            BodyMetric(id: UUID(), date: Date().addingTimeInterval(-86400 * 7), weight: 75.0, bodyFat: 15.0, photoData: nil),
            BodyMetric(id: UUID(), date: Date(), weight: 74.5, bodyFat: 14.8, photoData: nil)
        ]
    )

    // 4. Một buổi tập đã hoàn thành
    static let pastSession = Session(
        id: UUID(),
        templateId: chestTemplate.id,
        name: "Chest Day Alpha",
        startTime: Date().addingTimeInterval(-3600), // Tập cách đây 1 tiếng
        endTime: Date(),
        notes: "Cảm thấy rất sung sức, bài Push Up hơi mỏi tay sau.",
        exercises: [
            WorkoutExercise(
                id: UUID(),
                exerciseId: exercises[0].id,
                exerciseName: exercises[0].name,
                sets: [
                    WorkoutSet(id: UUID(), weight: 60, reps: 10, isCompleted: true),
                    WorkoutSet(id: UUID(), weight: 65, reps: 8, isCompleted: true)
                ]
            )
        ]
    )
}
