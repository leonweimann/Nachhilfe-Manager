//
//  ContentView.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 08.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab {
                HomeScreen()
            } label: {
                Label("Home", systemImage: "house")
            }
            
            Tab {
                CustomersScreen()
            } label: {
                Label("Customers", systemImage: "person.2")
            }
            
            Tab {
                FinancialsScreen()
            } label: {
                Label("Financials", systemImage: "chart.bar.xaxis")
            }
            
            Tab {
                ScheduleScreen()
            } label: {
                Label("Schedule", systemImage: "calendar.badge.clock")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
}
