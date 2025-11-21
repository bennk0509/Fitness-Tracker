//
//  GetDailyActivity.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-21.
//

final class GetDailyActivity{
    private let repository: ActivityRepository
    
    init(repository: ActivityRepository) {
        self.repository = repository
    }
    
    func execute() -> Activity {
        repository.getDailyActivity()
    }
}
