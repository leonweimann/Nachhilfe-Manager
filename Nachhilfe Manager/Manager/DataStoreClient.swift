//
//  DataStoreClient.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 15.09.24.
//

import Foundation
import SwiftData

@MainActor
class DataStoreClient {
    static var shared: DataStoreClient!
    private init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    var modelContext: ModelContext
    
    // MARK: -
    
    static func makeModelContainer(with appState: AppState, empty: Bool = false) -> ModelContainer {
        do {
            let container = try ModelContainer(
                for: Business.self, Customer.self, ImageModel.self,
                configurations: createModelConfiguration(with: appState)
            )
            
            if appState == .mocked && !empty {
                container.mainContext.insert(Business.sample())
                
            }
            
            shared = .init(modelContext: container.mainContext)
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

    // MARK: -
    
    func fetch<Model>(for type: Model.Type, descriptor: FetchDescriptor<Model> = .init()) -> [Model] where Model: PersistentModel {
        do {
            return try modelContext.fetch(descriptor)
        } catch {
            fatalError("Failed fetching \(Model.self) with error: \(error.localizedDescription)")
        }
    }
    
    func model<Model>(for id: Model.ID) -> Model where Model: PersistentModel {
        guard
            let identifier = id as? PersistentIdentifier,
            let model = modelContext.model(for: identifier) as? Model
        else {
            fatalError("Failed fetching \(Model.self) with error")
        }
        return model
    }
}
