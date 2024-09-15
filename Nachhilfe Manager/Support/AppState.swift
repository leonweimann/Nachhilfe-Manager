//
//  AppState.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 08.09.24.
//

import SwiftUI

enum AppState {
    case mocked, production
}

extension EnvironmentValues {
    @Entry var appState: AppState = .mocked
}

extension View {
    func appState(_ appState: AppState) -> some View {
        environment(\.appState, appState)
    }
}
