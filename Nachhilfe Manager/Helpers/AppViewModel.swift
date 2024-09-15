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
    
    var businesses: [Business] {
        do {
            let descriptor = FetchDescriptor<Business>(sortBy: [SortDescriptor(\.name)])
            return try modelContext.fetch(descriptor)
        } catch {
            fatalError("Fetch failed")
        }
    }
    
    var currentBusiness: Business?
}
