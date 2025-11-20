//
//  CalendarHorizontal.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-20.
//

import SwiftUI

struct CalendarHorizontal: View {
    let days = [
        ("27", "MON"),
        ("28", "TUE"),
        ("29", "WED"),
        ("30", "THU"),
        ("31", "FRI"),
        ("1",  "SAT"),
        ("2",  "SUN"),
        ("3",  "MON"),
        ("4",  "TUE"),
        ("5",  "WED")
    ]
    
    @State private var selectedIndex = 1
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 18) {
                ForEach(days.indices, id: \.self) { index in
                    let day = days[index]
                    VStack(spacing: 3) {
                        Text(day.0)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text(day.1)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(
                        selectedIndex == index ?
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.white.opacity(0.15))
                            .frame(height: 60)
                        : nil
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedIndex = index
                        }
                    }
                }
            }
            .frame(height: 70)
        }
        .frame(height: 70)
    }
}

#Preview {
    CalendarHorizontal()
}
