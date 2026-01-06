//
//  WorkoutTrackingView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2026-01-06.
//

import SwiftUI


struct WorkoutTrackingView: View {
    let sessionId: UUID
    
    @State private var vm: WorkoutTrackingViewModel
    @FocusState private var focusedField: FocusedField?
    
    @State private var showRestPicker = false
    @State private var restMinutes = 0
    
    init(sessionId: UUID, makeVM: @escaping (UUID) -> WorkoutTrackingViewModel) {
        self.sessionId = sessionId
        self._vm = State(wrappedValue: makeVM(sessionId))
    }
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                HStack{
                    VStack(alignment: .leading,spacing: 10){
                        Text(vm.session?.name ?? "Workout Name")
                            .font(Font.largeTitle)
                            .bold()
                        Text(vm.session?.description ?? "Add Description or note")
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
                            Text("00:00")
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
                            Text("Calories")
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
                            Text("Intensity")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 14)
                    
                    Divider()
                        .background(Color.white)
                }
                // Display exercises (Tracking)
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(vm.exercises) { ex in
                            VStack(alignment: .leading, spacing: 10) {

                                HStack {
                                    Text(ex.name)
                                        .font(.headline)
                                    Spacer()
                                    Button {
                                        print("Details")
                                    } label: {
                                        Image(systemName: "info.circle")
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                
                                Button {
                                    showRestPicker = true
                                } label: {
                                    Text(restMinutes == 0 ? "Rest Off" : "Rest \(restMinutes)m")
                                        .font(.caption.bold())
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 6)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(restMinutes == 0 ? Color.white.opacity(0.10) : Color.orange.opacity(0.35))
                                        )
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
                                    Text("Action")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .frame(width: 36, alignment: .leading)
                                }

                                VStack(spacing: 15){
                                    ForEach(ex.sets) { set in
                                        HStack(spacing: 10) {
                                            Text("\(set.setNumber)")
                                                .font(.subheadline.weight(.semibold))
                                                .frame(width: 28, height: 28)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .fill(Color.white.opacity(0.10))
                                                )
                                                .frame(width: 40, alignment: .leading)

                                            Text("\(set.weight, format: .number.precision(.fractionLength(2)))")
                                                .font(.subheadline.weight(.semibold))
                                                .frame(maxWidth: .infinity, minHeight: 28)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                                                )

                                            Text("\(set.reps)")
                                                .font(.subheadline.weight(.semibold))
                                                .frame(maxWidth: .infinity, minHeight: 28)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                                                )
                                            Image(systemName: "trash.fill")
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                                .frame(width: 36, alignment: .center)
                                        }
                                    }
                                }
                                Button {
//                                    vm.addNewSet(exerciseId: ex.id)
                                    print("Add New Set")
                                } label: {
                                    Label("ADD SET", systemImage: "plus")
                                        .font(.subheadline.weight(.semibold))
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                        .foregroundStyle(.orange)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.white.opacity(0.10))
                                        )
                                }
                                .padding(.top, 6)
                                
                            }
                        }
                    }
                }

                Button {
//                    vm.addNewExercise()
                    print("Add New Exercise")
                } label: {
                    Label("Add New Exercise", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.orange)
                        )
                }
            }
            .padding()
            .task {
                vm.load()
            }

        }.sheet(isPresented: $showRestPicker) {
            RestTimerView(isShown: $showRestPicker, minutes: $restMinutes) { newMinutes in
//                if newMinutes == 0 {
//                    vm.stopRest()
//                } else {
//                    vm.startRest(seconds: newMinutes * 60)
//                }
            }
            .presentationDetents([.height(350)])
            .presentationDragIndicator(.visible)
        }
        .foregroundColor(.white)
    }

}

#Preview {
    var sampleTrackingSession = sampleWorkouts[0]
    return WorkoutTrackingView(sessionId: sampleTrackingSession.id,
                            makeVM: {id in
        WorkoutTrackingViewModel(sessionId: id, getWorkoutSessionById: GetWorkoutSessionById(repository: MockUpWorkoutRepository()))
                                })
    
}
