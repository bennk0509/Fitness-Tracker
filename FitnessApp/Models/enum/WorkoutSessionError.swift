//
//  WorkoutSessionError.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//


enum WorkoutSessionError: Error, Equatable {
    case notFound
    case invalidExercise
    case invalidSet
    case validationFailed(reason: String)
    case persistenceFailed
}
