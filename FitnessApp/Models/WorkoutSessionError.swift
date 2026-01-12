enum WorkoutSessionError: Error, Equatable {
    case notFound
    case invalidExercise
    case invalidSet
    case validationFailed(reason: String)
    case persistenceFailed
}
