//
//  ContentView.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 08.09.24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    init(modelContext: ModelContext) {
        self._viewModel = .init(initialValue: .init(modelContext: modelContext))
    }
    
    @State private var viewModel: AppViewModel
    
    var body: some View {
        Group {
            if let currentBusiness = viewModel.currentBusiness {
                BusinessScreen(business: currentBusiness)
            } else {
                BusinessSelectionScreen(selection: $viewModel.currentBusiness)
            }
        }
        .environment(viewModel)
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Environment(\.modelContext) var modelContext
    ContentView(modelContext: modelContext)
}
