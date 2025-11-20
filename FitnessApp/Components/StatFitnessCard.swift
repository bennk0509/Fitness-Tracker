//
//  StatFitnessCard.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI

struct StatFitnessCard: View {
    var iconName: String;
    @Binding var number: Int;
    var text: String;
    var unit: String?;
    var color: Color;
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Image(systemName: iconName)
                .font(.system(size: 18, weight: .semibold))
                .frame(width: 40, height: 40)
                .background(
                    Circle().fill(Color.white)
                )
            }
            VStack(alignment: .leading, spacing: 5){
                HStack(alignment:.lastTextBaseline, spacing: 3){
                    Text("\(number)").font(.system(size: 15, weight: .bold))
                    if let unit = unit {
                        Text(unit)
                            .font(.system(size: 15, weight: .bold))
                    }
                }
                Text(text).font(.system(size: 13))
                    .foregroundColor(Color(.secondaryLabel))
            }.padding(10)
            
        }.padding(4)
            .background(Color(color.opacity(0.1)))
            .cornerRadius(21)
    }
}

#Preview {
    StatFitnessCard(iconName: "figure.walk", number: .constant(6823), text: "Steps", color: .green)
}
