//
//  MockupActivityRepository.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//


class MockupActivityRepository: ActivityRepository{
    func getDailyActivity() -> Activity {
        todayActivity
    }
    
}
