//
//  BusinessSelectionScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct BusinessSelectionScreen: View {
    @Binding var selection: Business?
    
    @Environment(AppViewModel.self) private var viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.businesses) { business in
                    BusinessPreview(business: business)
                }
            }
            .navigationTitle("Tutoring Manager")
        }
    }
}

#Preview(traits: .sampleData) {
    @Previewable @State var viewModel = AppViewModel(modelContext: DataStoreClient.shared.modelContext)
    BusinessSelectionScreen(selection: .constant(.sample()))
        .environment(viewModel)
}
