//
//  DataStoreClient.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 15.09.24.
//

import SwiftData

@MainActor
class DataStoreClient {
    private init() { }
    
    static func makeModelContainer(with appState: AppState, empty: Bool = false) -> ModelContainer {
        do {
            let container = try ModelContainer(
                for: Business.self, Customer.self,
                configurations: createModelConfiguration(with: appState)
            )
            
            if appState == .mocked && !empty {
                Customer.sample().forEach { sampleCustomer in
                    container.mainContext.insert(sampleCustomer)
                }
                
                container.mainContext.insert(Business.sample())
            }
            
            return container
        } catch {
            fatalError("Failed creating ModelContainer with error: \(error.localizedDescription)")
        }
    }
    
    private static func createModelConfiguration(with appState: AppState) -> ModelConfiguration {
        ModelConfiguration(
            isStoredInMemoryOnly: appState == .mocked,
            cloudKitDatabase: appState == .mocked ? .none : .automatic
        )
    }
}
