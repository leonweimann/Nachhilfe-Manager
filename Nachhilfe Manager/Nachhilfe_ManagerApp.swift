//
//  Nachhilfe_ManagerApp.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 08.09.24.
//

import SwiftData
import SwiftUI

@main
struct Nachhilfe_ManagerApp: App {
    @State private var viewModel = AppViewModel(/*with: .production*/)
    
    private var modelContainer: ModelContainer = {
        do {
            return try ModelContainer(for: Customer.self, configurations: .createConfig(with: .production))
        } catch {
            fatalError("Failed creating ModelContainer with error: \(error.localizedDescription)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(viewModel)
        .modelContainer(modelContainer)
        .environment(\.appState, .production)
    }
}
