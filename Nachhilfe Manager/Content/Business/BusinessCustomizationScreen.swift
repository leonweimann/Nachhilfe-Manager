//
//  BusinessCustomizationScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct BusinessCustomizationScreen: View {
    var business: Business
    
    var body: some View {
        ContentUnavailableView("Business Customization", systemImage: "pencil.and.outline")
    }
}

#Preview {
    BusinessCustomizationScreen(business: .sample())
}
