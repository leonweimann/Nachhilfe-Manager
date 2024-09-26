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
    let modelContainer = DataStoreClient.makeModelContainer(with: .production)
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelContext: modelContainer.mainContext)
        }
        .modelContainer(modelContainer)
        .environment(\.appState, .production)
    }
}
