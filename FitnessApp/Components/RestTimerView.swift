import SwiftUI

struct RestTimerView: View {
    @Binding var isShown: Bool
    @Binding var minutes: Int   // ⚠️ bây giờ là SECONDS

    var minSeconds: Int = 0
    var maxSeconds: Int = 30 * 60
    var step: Int = 30          // 30 giây mỗi lần + / -
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

            Text("Set how much you want to rest between two sets.")
                .foregroundColor(.gray)
                .font(.callout)
                .padding(.bottom, 10)

            Text("Time")
                .font(.callout.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            // Timer control
            HStack(spacing: 40) {

                // Minus 30s
                Button {
                    minutes = max(minSeconds, minutes - step)
                } label: {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 45, height: 45)
                        .overlay(
                            Image(systemName: "minus")
                                .font(.title3.bold())
                        )
                }
                .disabled(minutes <= minSeconds)
                .opacity(minutes <= minSeconds ? 0.5 : 1)

                // Time display mm:ss
                Text(minutes == 0 ? "Off" : timeString(minutes))
                    .font(.system(size: 50, weight: .semibold))
                    .monospacedDigit()

                // Plus 30s
                Button {
                    minutes = min(maxSeconds, minutes + step)
                } label: {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 45, height: 45)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.title3.bold())
                        )
                }
                .disabled(minutes >= maxSeconds)
                .opacity(minutes >= maxSeconds ? 0.5 : 1)
            }
            .padding(.vertical, 10)

            // Save button
            Button {
                onSave?(minutes)   // ⚠️ trả về SECONDS
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

    private func timeString(_ seconds: Int) -> String {
        let m = seconds / 60
        let s = seconds % 60
        return String(format: "%d:%02d", m, s)
    }
}
