//
//  BottomSheet.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool
    @GestureState private var translation: CGFloat = 0

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content

    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    init(
        isOpen: Binding<Bool>,
        maxHeight: CGFloat,
        @ViewBuilder content: () -> Content
    ) {
        self._isOpen = isOpen
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * 0.25   // 25% height collapsed
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {

                // Drag indicator
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                    .padding(8)

                content
            }
            .frame(width: geometry.size.width, height: maxHeight, alignment: .top)
            .background(Color("DarkGray"))
            .cornerRadius(20)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .offset(y: max(offset + translation, 0))
            .animation(.interactiveSpring(), value: isOpen)
            .animation(.interactiveSpring(), value: translation)
            .gesture(
                DragGesture()
                    .updating($translation) { value, state, _ in
                        state = value.translation.height
                    }
                    .onEnded { value in
                        let snapDistance = maxHeight * 0.2
                        if abs(value.translation.height) > snapDistance {
                            isOpen = value.translation.height < 0
                        }
                    }
            )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
