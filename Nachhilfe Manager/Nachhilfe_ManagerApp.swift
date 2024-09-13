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
    @State private var viewModel = AppViewModel(with: .production)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(viewModel)
        .modelContainer(viewModel.modelContainer)
        .environment(\.appState, viewModel.appState)
    }
}
