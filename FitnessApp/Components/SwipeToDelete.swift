//
//  SwipeToDelete.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-12.
//

import SwiftUI

struct SwipeToDelete<Content: View>: View {
    var onDelete: () -> Void
    var content: () -> Content

    @State private var offsetX: CGFloat = 0
    @GestureState private var dragX: CGFloat = 0
    
    // the width of the delete button
    private let deleteWidth: CGFloat = 80

    var body: some View {
        ZStack(alignment: .trailing) {

            Button {
                onDelete()
            } label: {
                Image(systemName: "trash.fill")
                    .foregroundColor(.white)
                    .frame(width: deleteWidth, height: 25)
                    .background(Color.red)
                    .cornerRadius(8)
            }

            content()
                .background(Color.black)
                .offset(x: min(offsetX + dragX, 0))
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .updating($dragX) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                if value.translation.width < -deleteWidth {
                                    offsetX = -deleteWidth
                                } else {
                                    offsetX = 0
                                }
                            }
                        }
                )
        }
        .frame(height: 44)
    }
}
