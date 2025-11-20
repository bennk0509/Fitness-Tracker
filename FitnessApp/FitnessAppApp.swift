//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by Khanh Anh Kiet Nguyen on 2025-11-15.
//

import SwiftUI
import CoreData

@main
struct FitnessAppApp: App {
    let persistenceController = PersistenceController.shared


    var body: some Scene {
        WindowGroup {
            FitnessTabView()
                .whiteText()
        }
    }
}
