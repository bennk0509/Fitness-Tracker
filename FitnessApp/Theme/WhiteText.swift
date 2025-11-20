//
//  WhiteText.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//


import SwiftUI

struct WhiteText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
    }
}

extension View {
    func whiteText() -> some View {
        self.modifier(WhiteText())
    }
}
