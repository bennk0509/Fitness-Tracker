import SwiftUI

struct CalendarHorizontal: View {
    @Binding var selectedDate: Date

    private let calendar = Calendar.current
    private let daysToShow: Int = 14

    private var days: [Date] {
        let anchor = calendar.startOfDay(for: Date())
        let start = calendar.date(byAdding: .day, value: -(daysToShow/2), to: anchor) ?? anchor
        return (0..<daysToShow).compactMap { calendar.date(byAdding: .day, value: $0, to: start) }
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(days, id: \.self) { day in
                        let isSelected = calendar.isDate(
                            calendar.startOfDay(for: day),
                            inSameDayAs: calendar.startOfDay(for: selectedDate)
                        )

                        VStack(spacing: 3) {
                            Text(dayNumber(day))
                                .font(.system(size: 18, weight: .semibold))

                            Text(weekdaySymbol(day))
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            Group {
                                if isSelected {
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.white.opacity(0.15))
                                        .frame(height: 60)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                        .id(calendar.startOfDay(for: day)) // ✅ id stable theo day
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedDate = calendar.startOfDay(for: day)
                                proxy.scrollTo(calendar.startOfDay(for: day), anchor: .center) // ✅ scroll về giữa
                            }
                        }
                    }
                }
                .frame(height: 70)
                .padding(.horizontal, 2)
            }
            .frame(height: 70)
            .onAppear {
                // ✅ Khi mở màn: scroll tới selectedDate (mặc định là today) nằm giữa
                DispatchQueue.main.async {
                    let target = calendar.startOfDay(for: selectedDate)
                    proxy.scrollTo(target, anchor: .center)
                }
            }
            .onChange(of: selectedDate) { _, newValue in
                // ✅ Khi selectedDate đổi từ ngoài (VM), cũng scroll theo
                withAnimation(.easeInOut(duration: 0.2)) {
                    proxy.scrollTo(calendar.startOfDay(for: newValue), anchor: .center)
                }
            }
        }
    }

    private func dayNumber(_ date: Date) -> String {
        String(calendar.component(.day, from: date))
    }

    private func weekdaySymbol(_ date: Date) -> String {
        let idx = calendar.component(.weekday, from: date) - 1
        return calendar.shortWeekdaySymbols[idx].uppercased()
    }
}
