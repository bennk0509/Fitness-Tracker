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
    
    var body: some View {
        VStack(spacing: 20) {
    
            HStack(spacing: 12) {
                Text("Rest timer")
                    .font(.title3.bold())
                Spacer()
            }
            
            Text("Set how much you want to rest between two sets for this workout.")
                .foregroundColor(.gray)
                .font(.callout)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Minutes")
                .font(.callout.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Timer control
            HStack(spacing: 40) {
                
                // Minus
                Button {
                    if minutes > 1 { minutes -= 1 }
                } label: {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 45, height: 45)
                        .overlay(
                            Image(systemName: "minus")
                                .font(.title3.bold())
                        )
                }
                
                // Time display (3:00 style)
                Text(String(format: "%d:00", minutes))
                    .font(.system(size: 50, weight: .semibold))
                    .monospacedDigit()
                
                // Plus
                Button {
                    minutes += 1
                } label: {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 45, height: 45)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.title3.bold())
                        )
                }
            }
            .padding(.vertical, 10)
            
            // Save button
            Button {
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
        .padding()
        .padding(.bottom, 50)
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(Color("DarkGray"))
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}
