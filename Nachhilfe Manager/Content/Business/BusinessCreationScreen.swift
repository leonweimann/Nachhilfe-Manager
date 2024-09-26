//
//  BusinessCreationScreen.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct BusinessCreationScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var business = Business.emptyInstance()
    
    var body: some View {
        VStack {
            Image(systemName: "plus")
            
            Text("Description")
            
            Text("TextField title")
            
            TextField("Your business name", text: $business.name)
            
            Button {
                
            } label: {
                Label("Confirm", systemImage: "chevron.forward")
            }
            
            Text("You will be able to change this etc.")
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    BusinessCreationScreen()
}
