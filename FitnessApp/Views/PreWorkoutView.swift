//
//  PreWorkoutView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import SwiftUI

struct PreWorkoutView: View {
    @State var vm: CreateWorkoutSessionViewModel;
    let makeTrackingVM: (UUID) -> WorkoutTrackingViewModel
    init(
        vm: CreateWorkoutSessionViewModel,
        makeTrackingVM: @escaping (UUID) -> WorkoutTrackingViewModel
    ) {
        self._vm = State(wrappedValue: vm)
        self.makeTrackingVM = makeTrackingVM
    }
    
    
    var body: some View {
        if let sessionID = vm.createdSession?.id {
           WorkoutTrackingView(sessionId: sessionID, makeVM: makeTrackingVM)
        } else{
            VStack(spacing:30) {
//                // STEP PROGRESS BAR
//                StepProgressBar(step: vm.currentStep, total: vm.totalSteps)
//                
                // STEP CONTENT
                Group {
                    if vm.currentStep == 1 {
                        Step1PreStartWorkout(currentStep: $vm.currentStep, isTemplate: $vm.isTemplate)
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                    
                    if vm.currentStep == 2 {
                        if(vm.isTemplate)
                        {
                            ShowWorkoutTemplate(currentStep: $vm.currentStep,
                                                templates: vm.workoutTemplates,
                                                onSelect: {template in vm.selectedTemplate(template)})
                        }
                    }
                    
                    if vm.currentStep == 3 {
                        if let selected = vm.selectedTemplate {
                            Step3ReviewAndCreateSessionView(workoutTemplate: selected,
                                                            editedExercises: $vm.editedExercises)
                                .transition(.move(edge: .trailing).combined(with: .opacity))
                        } else {
                            Text("No template selected")
                                .foregroundStyle(.secondary)
                        }
                    }

                }
                .animation(.easeInOut, value: vm.currentStep)
                
                HStack {
                    if vm.currentStep > 1 {
                        Button {
                            vm.currentStep -= 1
                        } label: {
                            Text("Back").foregroundStyle(.secondary)
                        }
                    }
                    
                    Spacer()
                    
                    if vm.currentStep == vm.totalSteps {
                        Button("Next") {
                            vm.createFromTemplate()
                        }
                    }
                }.padding(0)
            }
            .padding(20)
            .background(Color.black.ignoresSafeArea())
            .foregroundColor(.white)

        }
    }
}

#Preview {
    let sessionRepo = MockUpWorkoutRepository()
    let templateRepo = MockupWorkoutTemplateRepository()
    let exerciseRepo = MockupExerciseTemplateRepository()

    let createVM = CreateWorkoutSessionViewModel(
        createWorkoutSessionFromTemplate: CreateWorkoutSessionFromTemplate(
            workoutSessionRepository: sessionRepo,
            workoutTemplateRepository: templateRepo
        ),
        createWorkoutSessionNotFromTemplate: CreateWorkoutSessionNotFromTemplate(
            workoutSessionRepository: sessionRepo,
            workoutTemplateRepository: templateRepo
        ),
        getAllWorkoutTemplate: GetAllWorkoutTemplate(repository: templateRepo)
    )

    PreWorkoutView(
        vm: createVM,
        makeTrackingVM: { sessionID in
            WorkoutTrackingViewModel(
                sessionId: sessionID,
                getWorkoutSessionById: GetWorkoutSessionById(repository: sessionRepo),
                getAllExerciseTemplate: GetAllExerciseTemplate(repository: exerciseRepo)
            )
        }
    )
}
