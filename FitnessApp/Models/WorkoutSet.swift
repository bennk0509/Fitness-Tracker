import Foundation

struct WorkoutSet: Identifiable {
    let id = UUID()
    var reps: Int
    var weight: Double
}

struct WorkoutExercise: Identifiable {
    let id = UUID()
    var name: String
    var sets: [WorkoutSet] = []
}

struct WorkoutSession: Identifiable {
    let id = UUID()
    var startTime = Date()
    var exercises: [WorkoutExercise] = []
}
