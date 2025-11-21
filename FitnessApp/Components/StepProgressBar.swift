//
//  StepProgressBar.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import SwiftUI

struct StepProgressBar: View {
    var step: Int
    var total: Int

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))

                Capsule()
                    .fill(.white)
                    .frame(width: geo.size.width * CGFloat(step) / CGFloat(total))
                    .animation(.easeInOut(duration: 0.35), value: step)
            }
        }
        .frame(height: 8)
        .padding(.vertical, 10)
    }
}
