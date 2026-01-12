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
                    HStack(spacing: 10) {
                    // Pause / Resume
                    Button {
                        vm.togglePause()
                    } label: {
                        Image(systemName: vm.isPaused ? "play.fill" : "pause.fill")
                            .font(.headline)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.10))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    // Finish
                    Button {
                        vm.finishWorkout()
                    } label: {
                        Text("Finish")
                            .font(.subheadline.bold())
                            .padding(.horizontal, 14)
                            .padding(.vertical, 10)
                            .background(Color.orange)
                            .foregroundStyle(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                }
                VStack(spacing: 10) {
                    Divider()
                        .background(Color.white)
                    
                    HStack(spacing: 0) {
                        
                        VStack(spacing: 4) {
                            Text(vm.elapsedText)
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
                                        vm.openExerciseDetail(exerciseId: ex.id)
                                    } label: {
                                        Image(systemName: "ellipsis.circle")
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                
                                Button {
                                    vm.editingRestExerciseId = ex.id
                                    vm.showRestPicker = true
                                } label: {
                                    let rest = vm.restSeconds(for: ex.id)
                                    Text(rest == 0 ? "Rest Off" : "Rest \(rest)s")
                                        .font(.caption.bold())
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 6)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(rest == 0 ? Color.white.opacity(0.10) : Color.orange.opacity(0.35))
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

                                VStack {
                                    ForEach(ex.sets) { set in
                                        SwipeToDelete(onDelete: {
                                                vm.deleteSet(exerciseId: ex.id, setId: set.id)
                                        }){
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
                                                Button{
                                                    vm.finishSet(exerciseId: ex.id, setId: set.id)
                                                } label: {
                                                    Image(systemName: "checkmark.square")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .font(.caption)
                                                        .foregroundStyle(.secondary)
                                                        .frame(width: 36, height: 20, alignment: .center)
                                                }
                                                
                                            }.swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                                Button(role: .destructive) {
                                                    vm.deleteSet(exerciseId: ex.id, setId: set.id)
                                                } label: {
                                                    Label("Delete", systemImage: "trash")
                                                }
                                            }
                                        }
                                    }
                                }
                                Button {
                                    vm.addSet(exerciseID: ex.id)
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
                    vm.clickAddNewExercise()
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

        }.sheet(isPresented: $vm.showRestPicker) {
            let exId = vm.editingRestExerciseId

            RestTimerView(
                isShown: $vm.showRestPicker,
                minutes: Binding(
                    get: { exId.map { vm.restSeconds(for: $0) } ?? 0 },
                    set: { newValue in
                        guard let exId else { return }
                        vm.setRestSeconds(newValue, for: exId)
                    }
                )
            ) { _ in }
            .presentationDetents([.height(350)])
            .presentationDragIndicator(.visible)
            .onDisappear {
                vm.editingRestExerciseId = nil
            }
        }
        .sheet(item: $vm.restRequest) { req in
            RestCountdownView(totalSeconds: req.seconds) {
                vm.clearRest()
            }.presentationDetents([.height(350)])
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(true)
        }
        .sheet(item: $vm.showExercisesLib)
        {_ in 
            ShowExerciseTemplate(
                    exercises: vm.exerciseTemplates,
                    onSelect: { template in
                        vm.addExercise(from: template)
                        vm.showExercisesLib = nil
                    }
            )
            .presentationDragIndicator(.visible)
        }
        .sheet(item: $vm.exerciseDetailSheet) { sheet in
            ExerciseDetailSheetView(
                exerciseName: vm.session?.exercises.first(where: { $0.id == sheet.exerciseId })?.name ?? "Exercise",
                onDelete: {
                    vm.deleteExercise(exerciseId: sheet.exerciseId)
                    vm.closeExerciseDetail()
                }
            )
            .presentationDetents([.height(100)])
            .presentationDragIndicator(.visible)
        }
        .foregroundColor(.white)
    }

}

#Preview {
    let useCases = WorkoutTrackingUseCases(
        getWorkoutSessionById: GetWorkoutSessionById(repository: MockUpWorkoutRepository()),
        getAllExerciseTemplate: GetAllExerciseTemplate(repository: MockupExerciseTemplateRepository() ),
        addSetToExercise: AddSetToExercise(workoutSessionRepository: MockUpWorkoutRepository()),
        deleteSetFromExercise: DeleteSetFromExercise(workoutSessionRepository: MockUpWorkoutRepository()),
        updateSetWeight: UpdateSetWeight(repo: MockUpWorkoutRepository()),
        updateSetReps: UpdateSetReps(repo: MockUpWorkoutRepository()),
        addExerciseFromTemplate: AddExerciseFromTemplate(repo: MockUpWorkoutRepository()),
        deleteExerciseFromSession: DeleteExerciseFromSession(repo: MockUpWorkoutRepository()),
        finishWorkoutSession: FinishWorkoutSession(repo: MockUpWorkoutRepository())
    )
//    WorkoutTrackingViewModel(sessionId: id, useCases: useCases)
    var sampleTrackingSession = sampleWorkouts[0]
    WorkoutTrackingView(sessionId: sampleTrackingSession.id,
                        makeVM: {id in
        WorkoutTrackingViewModel(sessionId: id, useCases: useCases)
    })
}
