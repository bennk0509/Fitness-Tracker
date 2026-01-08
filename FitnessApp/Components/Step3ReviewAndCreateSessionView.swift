//
//  Step3ReviewAndCreateSessionView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import SwiftUI

enum FocusedField: Hashable {
    case weight(Int, Int)
    case reps(Int, Int)
}

struct Step3ReviewAndCreateSessionView: View {
//    @State private var workoutTemplate: WorkoutTemplate?
    let workoutTemplate: WorkoutTemplate
    
//    @State private var draftExercises: [ExerciseTemplate] = []
//
    @FocusState private var focusedField: FocusedField?

    @Binding var editedExercises: [ExerciseTemplate]
    var body: some View {
        VStack(alignment:.leading, spacing: 20){
            HStack{
                VStack(alignment:.leading, spacing: 10){
                    Text(workoutTemplate.name)
                        .font(.headline)
                    
                    Text("Add Description or note")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            VStack(spacing: 10) {
                
                Divider()
                    .background(Color.white)
                
                HStack(spacing: 0) {
                    
                    VStack(spacing: 4) {
                        Text("00:30")
                            .font(.title3.weight(.semibold))
                        Text("Est Duration")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                        .background(Color.white)
                        .frame(height: 36)
                    
                    VStack(spacing: 4) {
                        Text("500")
                            .font(.title3.weight(.semibold))
                        Text("Est Calories")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                        .background(Color.white)
                        .frame(height: 36)
                    
                    VStack(spacing: 4) {
                        Text("500")
                            .font(.title3.weight(.semibold))
                        Text("Est Calories")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 14)
                
                Divider()
                    .background(Color.white)
            }
            // Display exercises
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(editedExercises.indices, id: \.self) { exIdx in
                        let ex = editedExercises[exIdx]
                        let setCount = editedExercises[exIdx].defaultSets?.count ?? 0
                        VStack(alignment: .leading, spacing: 10) {
                            
                            
                            HStack{
                                Text(ex.name)
                                    .font(.headline)
                                Spacer()
                                Button {
                                    // Action: Code to execute when the button is tapped
                                    print("Details")
                                } label: {
                                    Image(systemName: "info.circle")
                                        .foregroundStyle(.secondary)
                                }
                            }
                            
                            HStack(spacing: 10) {
                                Text("Set")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .frame(width: 36, alignment: .leading)
                                
                                Text("Weight")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Reps")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            if setCount > 0 {
                                ForEach(0..<setCount, id: \.self) { setIdx in
                                    let setNumber = editedExercises[exIdx].defaultSets![setIdx].setNumber
                                    let weightText = Binding<String>(
                                        get: {
                                            let w = editedExercises[exIdx].defaultSets![setIdx].weight
                                            return w == 0 ? "" : w.formatted(.number.precision(.fractionLength(2)))
                                        },
                                        set: { newValue in
                                            let cleaned = newValue.replacingOccurrences(of: ",", with: ".")
                                            editedExercises[exIdx].defaultSets![setIdx].weight = Double(cleaned) ?? 0
                                        }
                                    )
                                    let repsText = Binding<String>(
                                        get: {
                                            let r = editedExercises[exIdx].defaultSets![setIdx].reps
                                            return r == 0 ? "" : String(r)
                                        },
                                        set: { newValue in
                                            editedExercises[exIdx].defaultSets![setIdx].reps = Int(newValue) ?? 0
                                        }
                                    )
                                    HStack(spacing: 10) {
                                        Text("\(setNumber)")
                                            .font(.subheadline.weight(.semibold))
                                            .frame(width: 28, height: 28)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(Color.white.opacity(0.10))
                                            )
                                            .frame(width: 40, alignment: .leading)
                                        
                                        TextField("", text: weightText)
                                            .keyboardType(.decimalPad)
                                            .font(.subheadline.weight(.semibold))
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity, minHeight: 28)
                                            .focused($focusedField, equals: .weight(exIdx, setIdx))
                                            .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(
                                                            focusedField == .weight(exIdx, setIdx)
                                                            ? Color.orange
                                                            : Color.white.opacity(0.20),
                                                            lineWidth: 1.5
                                                        )
                                                )
                                        TextField("", text: repsText)
                                            .keyboardType(.numberPad)
                                            .font(.subheadline.weight(.semibold))
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity, minHeight: 28)
                                            .focused($focusedField, equals: .reps(exIdx, setIdx))
                                            .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(
                                                            focusedField == .reps(exIdx, setIdx)
                                                            ? Color.orange
                                                            : Color.white.opacity(0.20),
                                                            lineWidth: 1.5
                                                        )
                                                )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.onAppear{
            if editedExercises.isEmpty{
                editedExercises = workoutTemplate.defaultExercises
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var edits: [ExerciseTemplate] = []
        var body: some View {
            Step3ReviewAndCreateSessionView(
                workoutTemplate: sampleWorkoutTemplates[0],
                editedExercises: $edits
            )
        }
    }
    return PreviewWrapper()
}
