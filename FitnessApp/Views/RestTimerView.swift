//
//  RestTimerView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import SwiftUI

struct RestTimerView: View {
    @Binding var isShown: Bool
    @Binding var minutes: Int

    var minMinutes: Int = 0 
    var maxMinutes: Int = 30
    var step: Int = 1
    var onSave: ((Int) -> Void)? = nil

    var body: some View {
        VStack(spacing: 20) {

            HStack(spacing: 12) {
                Text("Rest timer")
                    .font(.title.bold())
                Spacer()

                Button {
                    isShown = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.secondary)
                        .padding(8)
                }
            }

            Text("Set how much you want to rest between two sets for this workout.")
                .foregroundColor(.gray)
                .font(.callout)
                .padding(.bottom, 10)

            Text("Minutes")
                .font(.callout.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            // Timer control
            HStack(spacing: 40) {

                // Minus
                Button {
                    minutes = max(minMinutes, minutes - step)
                } label: {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 45, height: 45)
                        .overlay(
                            Image(systemName: "minus")
                                .font(.title3.bold())
                        )
                }
                .disabled(minutes <= minMinutes)
                .opacity(minutes <= minMinutes ? 0.5 : 1)

                // Time display
                Text(minutes == 0 ? "Off" : String(format: "%d:00", minutes))
                    .font(.system(size: 50, weight: .semibold))
                    .monospacedDigit()

                // Plus
                Button {
                    minutes = min(maxMinutes, minutes + step)
                } label: {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 45, height: 45)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.title3.bold())
                        )
                }
                .disabled(minutes >= maxMinutes)
                .opacity(minutes >= maxMinutes ? 0.5 : 1)
            }
            .padding(.vertical, 10)

            // Save button
            Button {
                onSave?(minutes)
                isShown = false
            } label: {
                Text("Save")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .padding(.top, 10)

        }
        .foregroundStyle(.black)
        .padding()
    }
}
