//
//  AppViewModel.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 08.09.24.
//

import Observation
import SwiftData
import SwiftUI

@MainActor @Observable
final class AppViewModel {
    init(with appState: AppState = .mocked) {
        self.appState = appState
    }
    
    var modelContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: false, allowsSave: true)
            return try ModelContainer(for: Customer.self, configurations: config)
        } catch {
            fatalError("Failed creating ModelContainer with error: \(error.localizedDescription)")
        }
    }()
    
    var appState: AppState

    let cal = CalManager()
}
