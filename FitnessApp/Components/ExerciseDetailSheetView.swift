//
//  ExerciseDetailSheetView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI

struct ExerciseDetailSheetView: View {
    let exerciseName: String
    let onDelete: () -> Void
    
    @State private var confirmDelete = false

    var body: some View {
        VStack(spacing: 16) {
            Button(role: .destructive) {
                confirmDelete = true
            } label: {
                Label("Delete Exercise", systemImage: "trash")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 44)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)

            Spacer(minLength: 0)
        }
        .padding()
        .confirmationDialog("Delete this exercise?", isPresented: $confirmDelete, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                onDelete()
            }
            Button("Cancel", role: .cancel) {}
        }
    }
}
