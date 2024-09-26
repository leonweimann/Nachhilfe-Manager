//
//  ConfirmationRequiredButton.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct ConfirmationRequiredButton<C>: View where C: View {
    var role: ButtonRole? = nil
    var action: () -> Void
    var title = "Confirm your action"
    var message = ""
    @ViewBuilder var label: () -> C
    
    @State private var show = false
    
    var body: some View {
        Button(role: role) {
            show.toggle()
        } label: {
            label()
        }
        .confirmationDialog(title, isPresented: $show) {
            Button(role: .destructive, action: action) {
                Text("Confirm")
            }
        } message: {
            Text(message)
        }
    }
}

#Preview {
    ConfirmationRequiredButton(action: {}, title: "Delete Business", message: "Are you sure?") {
        Label("Delete", systemImage: "trash")
    }
    .tint(.red)
    .foregroundStyle(.red)
}
