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
                            SelectableBusinessComponent(for: business)
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
    
    // MARK: -
    
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
    
    private func SelectableBusinessComponent(for business: Business) -> some View {
        Button {
            
        } label: {
            BusinessPreview(business: business)
        }
        .tint(.primary)
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            DeleteButton(for: business)
        }
        .contextMenu {
            FavoritiseButton(for: business)
            Section {
                DeleteButton(for: business)
            }
        }
    }
    
    private func DeleteButton(for business: Business) -> some View {
        ConfirmationRequiredButton(
            role: .destructive,
            action: { viewModel.modelContext.delete(business) },
            title: "Delete Business",
            message: "Are you sure?"
        ) {
            Label("Delete", systemImage: "trash")
        }
        .tint(.red)
    }
    
    private func FavoritiseButton(for business: Business) -> some View {
        Button {
            business.isFavorite.toggle()
        } label: {
            Label("Favorite", systemImage: business.isFavorite ? "star.fill" : "star")
        }
        .tint(.yellow)
    }
}

#Preview(traits: .sampleData) {
    @Previewable @State var viewModel = AppViewModel(modelContext: DataStoreClient.shared.modelContext)
    BusinessSelectionScreen(selection: $viewModel.currentBusiness)
        .environment(viewModel)
}
