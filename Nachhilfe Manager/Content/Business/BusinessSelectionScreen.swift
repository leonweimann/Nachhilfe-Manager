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
    
    @State private var showCreation = false
    @State private var customizationItem: Business?
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.businesses.isEmpty {
                    emptyDataView
                } else {
                    List {
                        if favorites.count > 0 {
                            Section("Favorites") {
                                ForEach(favorites) { business in
                                    SelectableBusinessComponent(for: business)
                                }
                            }
                        }
                        
                        ForEach(nonFavorites) { business in
                            SelectableBusinessComponent(for: business)
                        }
                    }
                }
            }
            .sheet(isPresented: $showCreation) {
                BusinessCreationScreen()
            }
            .sheet(item: $customizationItem) {
                customizationItem = nil
            } content: { business in
                BusinessCustomizationScreen(business: business)
            }
            
            .navigationTitle("Tutoring Manager")
            .toolbar { toolbar }
        }
    }
    
    // MARK: -
    
    private var favorites: [Business] {
        viewModel.businesses
            .filter { $0.isFavorite }
    }
    
    private var nonFavorites: [Business] {
        viewModel.businesses
            .filter { !$0.isFavorite }
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
            showCreation.toggle()
        } label: {
            Label("Create Business", systemImage: "plus")
        }
    }
    
    private func SelectableBusinessComponent(for business: Business) -> some View {
        Button {
            selection = business
        } label: {
            BusinessPreview(business: business)
        }
        .tint(selection?.id == business.id ? .primary : .secondary)
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            FavoritiseButton(for: business)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            DeleteButton(for: business)
            CustomizeButton(for: business)
        }
        .contextMenu {
            FavoritiseButton(for: business)
            CustomizeButton(for: business)
            
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
    
    private func CustomizeButton(for business: Business) -> some View {
        Button {
            customizationItem = business
        } label: {
            Label("Customize", systemImage: "pencil")
        }
        .tint(.accentColor)
    }
    
    private func FavoritiseButton(for business: Business) -> some View {
        Button {
            withAnimation(.smooth) {
                business.isFavorite.toggle()
            }
        } label: {
            Label("Favorite", systemImage: business.isFavorite ? "star.slash" : "star")
        }
        .tint(.yellow)
    }
}

#Preview(traits: .sampleData) {
    @Previewable @State var viewModel = AppViewModel(modelContext: DataStoreClient.shared.modelContext)
    BusinessSelectionScreen(selection: $viewModel.currentBusiness)
        .environment(viewModel)
}
