//
//  ScheduleScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftUI

struct ScheduleScreen: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView("Schedule", systemImage: "calendar.badge.clock")
                .navigationTitle("Schedule")
        }
    }
}

#Preview {
    ScheduleScreen()
}
