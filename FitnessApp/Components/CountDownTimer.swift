//
//  CountDownTimer.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-07.
//

import SwiftUI
import Combine

struct RestCountdownView: View {
    // totalSeconds là số giây ban đầu (vd: 60, 90, 120...)
    let totalSeconds: Int
    var onFinished: (() -> Void)? = nil

    @Environment(\.dismiss) private var dismiss

    @State private var remainingSeconds: Int
    @State private var isRunning: Bool = true

    private let tick = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(totalSeconds: Int, onFinished: (() -> Void)? = nil) {
        self.totalSeconds = max(0, totalSeconds)
        self.onFinished = onFinished
        _remainingSeconds = State(initialValue: max(0, totalSeconds))
    }

    var body: some View {
        VStack(spacing: 20) {

            HStack(spacing: 12) {
                Text("Rest timer")
                    .font(.title.bold())
                Spacer()
            }

            // Countdown display
            Text(timeString(remainingSeconds))
                .font(.system(size: 100, weight: .semibold))
                .monospacedDigit()
                .padding(.vertical, 10)

            // 3 buttons: -15s, +15s, Skip
            HStack(spacing: 12) {
                Button {
                    adjust(by: -15)
                } label: {
                    controlPill(label: "-15s", systemImage: "gobackward.15")
                }
                .disabled(remainingSeconds <= 0)

                Button {
                    adjust(by: 15)
                } label: {
                    controlPill(label: "+15s", systemImage: "goforward.15")
                }

                Button {
                    skip()
                } label: {
                    controlPill(label: "Skip", systemImage: "forward.end")
                }

            }

        }
        .foregroundStyle(.black)
        .padding()
        .onReceive(tick) { _ in
            guard isRunning else { return }
            guard remainingSeconds > 0 else { return }

            remainingSeconds -= 1

            if remainingSeconds <= 0 {
                finish()
            }
        }
    }

    private func finish() {
        isRunning = false
        onFinished?()
        dismiss()
    }

    private func skip() {
        remainingSeconds = 0
        finish()
    }

    private func adjust(by delta: Int) {
        remainingSeconds = max(0, remainingSeconds + delta)
        if remainingSeconds == 0 {
            finish()
        }
    }

    private func timeString(_ seconds: Int) -> String {
        if seconds <= 0 { return "Done" }
        let m = seconds / 60
        let s = seconds % 60
        return String(format: "%d:%02d", m, s)
    }

    private func controlPill(label: String, systemImage: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: systemImage)
            Text(label).font(.callout.bold())
        }
        .foregroundStyle(.black)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    RestCountdownView(totalSeconds: 90) {
        print("Finished rest")
    }
    .presentationDetents([.height(350)])
}

