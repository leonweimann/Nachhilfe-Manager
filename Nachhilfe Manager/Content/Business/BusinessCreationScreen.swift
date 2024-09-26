//
//  BusinessCreationScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct BusinessCreationScreen: View {
    @State private var business = Business.emptyInstance()
    
    var body: some View {
        ContentUnavailableView("Business Creation", systemImage: "plus")
    }
}

#Preview {
    BusinessCreationScreen()
}
