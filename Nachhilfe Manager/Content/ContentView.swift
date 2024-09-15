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
        Text("\(viewModel.businesses.count)")
    }
}

#Preview(traits: .emptyData) {
    @Previewable @Environment(\.modelContext) var modelContext
    ContentView(modelContext: modelContext)
}
