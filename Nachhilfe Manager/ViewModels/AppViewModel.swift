//
//  AppViewModel.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftData
import SwiftUI

@Observable @MainActor
final class AppViewModel {
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    var modelContext: ModelContext
    
    var businesses: [Business] { DataStoreClient.shared.fetch(for: Business.self, descriptor: .init(sortBy: [.init(\.name)])) }
    
    @ObservationIgnored @PersistenceSelection("currentBusiness")
    var currentBusiness: Business?
}
