//
//  BusinessAddingScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct BusinessAddingScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                RoutingPathOptionView(
                    "Create new business",
                    symbol: "plus",
                    heading: "Create"
                ) {
                    BusinessCreationScreen()
                }
                
                RoutingPathOptionView(
                    "Connect to existing business",
                    symbol: "arrow.2.circlepath",
                    heading: "Connect (coming soon)"
                ) {
                    
                }
                .disabled(true)
            }
            .navigationTitle("Add a business")
            .toolbar { toolbar }
        }
    }
    
    // MARK: -
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                dismiss()
            } label: {
                Label("Cancel", systemImage: "xmark")
                    .labelStyle(.titleOnly)
            }
        }
    }
    
    private func RoutingPathOptionView<D>(_ title: String, symbol: String, heading: String,  @ViewBuilder destination: @escaping () -> D) -> some View where D: View {
        Section(heading) {
            NavigationLink {
                destination()
            } label: {
                ContentUnavailableView(title, systemImage: symbol)
                    .padding(.vertical)
                    .foregroundStyle(.tint)
            }
        }
    }
}

#Preview {
    BusinessAddingScreen()
}
