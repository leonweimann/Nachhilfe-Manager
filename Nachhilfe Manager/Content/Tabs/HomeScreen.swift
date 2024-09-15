//
//  HomeScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var showSettingsSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                // Temp
                ContentUnavailableView("Home", systemImage: "house")
                    .padding()
                
                Section("Widgets") {
                    // This section should present fully customizable widgets, displaying information instead of functionality (may incorporate?)
                    
                }
                
                Section("Quick Actions") {
                    // Here should be buttons like shortcut widget, which users can adjust fully to their needs
                    
                }
                
                Section("News") {
                    // This section should be dynamic switching the position in the list hierarchy, so if necessary its the first item, else its just anywhere after the custom sections
                    
                }
            }
            .navigationTitle("Tutoring")
            .toolbar { toolbar }
        }
        .sheet(isPresented: $showSettingsSheet) {
            SettingsScreen()
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                showSettingsSheet.toggle()
            } label: {
                Label("Settings", systemImage: "gearshape")
            }
        }
    }
}

#Preview {
    HomeScreen()
}
