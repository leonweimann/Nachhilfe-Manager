//
//  ModelConfiguration+Extension.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftData

extension ModelConfiguration {
    static func createConfig(with appState: AppState) -> ModelConfiguration {
        ModelConfiguration(
            isStoredInMemoryOnly: appState == .mocked,
            cloudKitDatabase: appState == .mocked ? .none : .automatic
        )
    }
}
