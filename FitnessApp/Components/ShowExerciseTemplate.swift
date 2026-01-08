//
//  ShowExerciseTemplate.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-07.
//


import SwiftUI

struct ShowExerciseTemplate: View {
    @State private var searchText: String = ""
    @Binding var currentStep: Int

    let exercises: [ExerciseTemplate]
    let onSelect: (ExerciseTemplate) -> Void

    // expand per exercise
    @State private var expanded: [UUID: Bool] = [:]

    // filter by search
    private var filtered: [ExerciseTemplate] {
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if q.isEmpty { return exercises }
        return exercises.filter { $0.name.lowercased().contains(q) }
    }

    var body: some View {
        VStack(spacing: 20) {

            HStack {
                Text("Library")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }

            HStack(spacing: 20) {
                Text("Exercises")
                    .font(.callout)
                    .bold()
                Text("Favorite exercises")
                    .font(.callout)
                    .bold()
                    .foregroundColor(.gray)
                Spacer()
            }

            // Search
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    TextField("Search exercise", text: $searchText)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color("DarkGray"))
                .cornerRadius(20)
            }

            // List
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(filtered) { ex in
                        Button {
                            onSelect(ex)
                        } label: {
                            VStack(spacing: 10) {

                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(ex.name)
                                            .font(.system(size: 18, weight: .semibold))
                                    }

                                    Spacer()
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .onAppear {
                                if expanded[ex.id] == nil {
                                    expanded[ex.id] = false
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ShowExerciseTemplate(
            currentStep: .constant(2),
            exercises: sampleExerciseTemplates,
            onSelect: { _ in }
        )
        .padding()
        .foregroundColor(.white)
    }
}
