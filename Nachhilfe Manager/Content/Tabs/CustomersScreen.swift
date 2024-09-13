//
//  CustomersScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftUI

struct CustomersScreen: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView("Customers", systemImage: "person.2")
                .navigationTitle("Customers")
        }
    }
}

#Preview {
    CustomersScreen()
}
