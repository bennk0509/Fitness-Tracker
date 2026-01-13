//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI



//@Observable
//class HomeViewModel{
//    private let workoutRepository: WorkoutRepository
//    private let activityRepository: ActivityRepository
//    
//    var workouts: [Workout] = []
//    var dailyActivity: Activity = Activity(steps: 0, calories: 0, exercise: 0)
//
//
//    init(workoutRepository: WorkoutRepository, activityRepository: ActivityRepository) {
//        self.workoutRepository = workoutRepository
//        self.activityRepository = activityRepository
//        fetchInitialData()
//    }
//    
//    // VIEWMODEL thì có fetch data không ạ?
//    private func fetchInitialData(){
//        workouts = workoutRepository.fetchAllWorkouts()
//        dailyActivity = activityRepository.getDailyActivity()
//    }
//}

@Observable
class HomeViewModel{
    private let getAllWorkouts: GetAllWorkouts
    private let getDailyActivity: GetDailyActivity
    private let getAllWorkoutTemplate: GetAllWorkoutTemplate
    
    var workouts: [WorkoutSession] = []
    var workoutTemplates: [WorkoutTemplate] = []
    var dailyActivity: Activity = Activity(steps: 0, calories: 0, exercise: 0)
    
    var selectedDate: Date = Calendar.current.startOfDay(for: Date())

    func selectDate(_ date: Date) {
        selectedDate = date
//        loadWorkouts(for: date)
    }

    
    init(getAllWorkouts: GetAllWorkouts,
         getDailyActivity: GetDailyActivity,
         getAllWorkoutTemplate: GetAllWorkoutTemplate)
    {
        self.getAllWorkouts = getAllWorkouts
        self.getDailyActivity = getDailyActivity
        self.getAllWorkoutTemplate = getAllWorkoutTemplate
        fetchInitialData()
    }
    
    private func fetchInitialData(){
        workouts = getAllWorkouts.execute()
        dailyActivity = getDailyActivity.execute()
        workoutTemplates = getAllWorkoutTemplate.execute()
    }
    
    func getWorkoutDate(_ date: Date){
    }
}
