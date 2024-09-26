//
//  BusinessAddingScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct BusinessAddingScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var business = Business.emptyInstance()
    
    var body: some View {
        NavigationStack {
            Form {
                RoutingPathOptionView(
                    "Create new business",
                    symbol: "plus",
                    heading: "Create"
                ) {
                    
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
        .interactiveDismissDisabled()
    }
    
    // MARK: -
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            ConfirmationRequiredButton(action: dismiss.callAsFunction, title: "Cancel", message: "Cancel business creation") {
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
            }
            .listRowBackground(
                Rectangle()
                    .fill(Color.accentColor.quaternary)
            )
        }
    }
}

#Preview {
    BusinessAddingScreen()
}
