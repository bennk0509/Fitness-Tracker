//
//  PreWorkoutView.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

import SwiftUI

struct PreWorkoutView: View {
    @State var vm: CreateWorkoutSessionViewModel;
    
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(spacing: 30) {
                
                // STEP PROGRESS BAR
                StepProgressBar(step: vm.currentStep, total: vm.totalSteps)
                
                // STEP CONTENT
                Group {
                    if vm.currentStep == 1 {
                        Step1PreStartWorkout(currentStep: $vm.currentStep, isTemplate: $vm.isTemplate)
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                    
                    if vm.currentStep == 2 {
                        if(vm.isTemplate)
                        {
                            ShowWorkoutTemplate(templates: vm.workoutTemplates)
                        }
                    }
                    
                    if vm.currentStep == 3 {
//                        Step3ReviewAndCreateSessionView()
//                            .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                }
                .animation(.easeInOut, value: vm.currentStep)
                
                
                
                
                // NAV BUTTONS
                HStack {
                    if vm.currentStep > 1 {
                        Button("Back") {
                            vm.currentStep -= 1
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    if vm.currentStep < vm.totalSteps {
                        Button("Next") {
                            vm.currentStep += 1
                        }
                        .padding()
                    }
                }
            }
            .padding(20)
            .background(Color.black.ignoresSafeArea())
            .foregroundColor(.white)
        }
    }
}

#Preview {
    PreWorkoutView(
        vm: CreateWorkoutSessionViewModel(
            createWorkoutSessionFromTemplate:
                CreateWorkoutSessionFromTemplate(workoutSessionRepository: MockUpWorkoutRepository(), workoutTemplateRepository: MockupWorkoutTemplateRepository()),
            createWorkoutSessionNotFromTemplate:
                CreateWorkoutSessionNotFromTemplate(workoutSessionRepository: MockUpWorkoutRepository(), workoutTemplateRepository: MockupWorkoutTemplateRepository()),
            getAllWorkoutTemplate:
                GetAllWorkoutTemplate(repository: MockupWorkoutTemplateRepository()))
    )
}
