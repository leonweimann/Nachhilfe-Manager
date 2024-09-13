//
//  SettingsScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                
            }
            .navigationTitle("Settings")
            .toolbar { toolbar }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                dismiss()
            } label: {
                Label("Dismiss", systemImage: "xmark.circle.fill")
                    .foregroundStyle(.tint, .placeholder)
            }
        }
    }
}

#Preview {
    SettingsScreen()
}
