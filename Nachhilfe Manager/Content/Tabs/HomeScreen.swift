//
//  HomeScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView("Home", systemImage: "house")
            
            
                .navigationTitle("Tutoring")
                .toolbar {
                    Button(action: {}) {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
        }
    }
}

#Preview {
//    HomeScreen()
    ContentView()
}
