//
//  TESTING.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-07.
//

import SwiftUI

struct DragSwipeDeleteDemo: View {
    struct Row: Identifiable, Equatable {
        let id = UUID()
        var title: String
    }

    @State private var rows: [Row] = [
        .init(title: "Bench Press"),
        .init(title: "Squat"),
        .init(title: "Deadlift"),
        .init(title: "Overhead Press")
    ]

    @State private var openRowID: UUID? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ForEach(rows) { row in
                    SwipeRow(
                        title: row.title,
                        isOpen: openRowID == row.id,
                        onOpen: { openRowID = row.id },
                        onClose: { if openRowID == row.id { openRowID = nil } },
                        onDelete: {
                            withAnimation(.spring()) {
                                rows.removeAll { $0.id == row.id }
                                if openRowID == row.id { openRowID = nil }
                            }
                        }
                    )
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundStyle(.white)
    }
}

private struct SwipeRow: View {
    let title: String
    let isOpen: Bool
    let onOpen: () -> Void
    let onClose: () -> Void
    let onDelete: () -> Void

    private let revealWidth: CGFloat = 84
    private let openThreshold: CGFloat = 40
    private let deleteThreshold: CGFloat = 140

    @State private var offsetX: CGFloat = 0
    @GestureState private var dragX: CGFloat = 0

    var body: some View {
        ZStack(alignment: .trailing) {
            // Background actions
            HStack {
                Spacer()
                Button(role: .destructive) { onDelete() } label: {
                    Image(systemName: "trash.fill")
                        .font(.title3.weight(.semibold))
                        .frame(width: revealWidth, height: 56)
                }
                .buttonStyle(.plain)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            // Foreground card
            HStack(spacing: 12) {
                Image(systemName: "dumbbell.fill")
                Text(title).font(.headline)
                Spacer()
                Image(systemName: "checkmark.square")
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 14)
            .frame(height: 56)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.10))
            )
            .contentShape(Rectangle())
            .offset(x: clampedOffset)
            .gesture(dragGesture)
            .onChange(of: isOpen) { _, newValue in
                // sync state when another row opens
                withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                    offsetX = newValue ? -revealWidth : 0
                }
            }
        }
    }

    private var clampedOffset: CGFloat {
        let raw = offsetX + dragX
        // only allow left swipe, clamp
        return max(-200, min(0, raw))
    }

    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .updating($dragX) { value, state, _ in
                // Prefer horizontal swipe: ignore if vertical dominates
                if abs(value.translation.width) > abs(value.translation.height) {
                    state = value.translation.width
                } else {
                    state = 0
                }
            }
            .onChanged { value in
                if abs(value.translation.width) > abs(value.translation.height) {
                    // user is swiping horizontally => close others
                    if !isOpen { onOpen() }
                }
            }
            .onEnded { value in
                let endX = offsetX + value.translation.width

                withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                    if abs(value.translation.width) > abs(value.translation.height),
                       value.translation.width < -deleteThreshold {
                        onDelete()
                        return
                    }

                    if endX < -openThreshold {
                        offsetX = -revealWidth
                        onOpen()
                    } else {
                        offsetX = 0
                        onClose()
                    }
                }
            }
    }
}


#Preview {
    DragSwipeDeleteDemo()
}
