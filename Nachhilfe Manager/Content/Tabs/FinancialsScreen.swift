//
//  FinancialsScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftUI

struct FinancialsScreen: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView("Financials", systemImage: "chart.bar.xaxis")
                .navigationTitle("Financials")
        }
    }
}

#Preview {
    FinancialsScreen()
}
