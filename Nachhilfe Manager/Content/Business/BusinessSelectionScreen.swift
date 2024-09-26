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
    
    @State private var showBusinessCreation = false
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.businesses.isEmpty {
                    emptyDataView
                } else {
                    List {
                        ForEach(viewModel.businesses) { business in
                            BusinessPreview(business: business)
                        }
                    }
                }
            }
            .navigationTitle("Tutoring Manager")
            .toolbar { toolbar }
            .sheet(isPresented: $showBusinessCreation) {
                BusinessCreationScreen()
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            createBusinessButton
        }
    }
    
    private var emptyDataView: some View {
        ContentUnavailableView {
            Label("No business", systemImage: "tray")
        } description: {
            Text("You don't have any businesses yet.")
        } actions: {
            createBusinessButton
        }
    }
    
    private var createBusinessButton: some View {
        Button {
            showBusinessCreation.toggle()
        } label: {
            Label("Create Business", systemImage: "plus")
        }
    }
}

#Preview(traits: .emptyData) {
    @Previewable @State var viewModel = AppViewModel(modelContext: DataStoreClient.shared.modelContext)
    BusinessSelectionScreen(selection: .constant(.sample()))
        .environment(viewModel)
}
