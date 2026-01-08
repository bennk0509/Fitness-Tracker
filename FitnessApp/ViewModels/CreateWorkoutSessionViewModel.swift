//
//  AddWorkoutSessionViewModel.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-19.
//


import SwiftUI


@Observable
class CreateWorkoutSessionViewModel {
    
    private let createWorkoutSessionFromTemplate : CreateWorkoutSessionFromTemplate
    private let createWorkoutSessionNotFromTemplate: CreateWorkoutSessionNotFromTemplate
    private let getAllWorkoutTemplate: GetAllWorkoutTemplate
    
    
    var createdSession: WorkoutSession? = nil
    var currentStep: Int = 1
    let totalSteps: Int = 3
    var isTemplate: Bool = false
    
    
    
    var workoutTemplates: [WorkoutTemplate] = []
    var selectedTemplate: WorkoutTemplate? = nil
    
    
    var editedExercises: [ExerciseTemplate] = []
    
    init(
        createWorkoutSessionFromTemplate: CreateWorkoutSessionFromTemplate,
        createWorkoutSessionNotFromTemplate: CreateWorkoutSessionNotFromTemplate,
        getAllWorkoutTemplate: GetAllWorkoutTemplate
        ) {
            self.createWorkoutSessionFromTemplate = createWorkoutSessionFromTemplate
            self.createWorkoutSessionNotFromTemplate = createWorkoutSessionNotFromTemplate
            self.getAllWorkoutTemplate = getAllWorkoutTemplate
            getTemplates()
    }
    
    // FLOW A: Create from template
    func createFromTemplate() {
        guard isTemplate else {return}
        guard let templateID = selectedTemplate?.id else {return}

        let workoutSession = createWorkoutSessionFromTemplate.execute(templateId: templateID)
        createdSession = workoutSession
    }
        
        
    // FLOW B: Create from exercise templates
    func createFromCustomExercises(exerciseTemplates: [ExerciseTemplate], title: String) async {
        let workoutSession = createWorkoutSessionNotFromTemplate.execute(
            exercises: exerciseTemplates,
            name: title)
        createdSession = workoutSession
    }
    
    func getTemplates(){
        workoutTemplates = getAllWorkoutTemplate.execute()
    }
    
    
    func nextStep() {
        if currentStep < totalSteps { currentStep += 1 }
    }
    
    func previousStep() {
        if currentStep > 1 { currentStep -= 1 }
    }
    
    func selectedTemplate(_ template: WorkoutTemplate)
    {
        
        selectedTemplate = template
        editedExercises = template.defaultExercises
        currentStep = 3
    }
    

}
