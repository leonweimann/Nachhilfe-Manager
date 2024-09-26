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
            Image(systemName: "storefront")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.tint.secondary)
                .frame(width: 200, height: 200)
                .padding(32)
            
            Text("Choose the name of your business")
                .foregroundStyle(.secondary)
            
            Divider()
                .padding(.vertical)
            
            TextField("Example Business", text: $business.name)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.words)
                .textContentType(.organizationName)
                .padding(24)
            
            Spacer()
            
            NavigationLink {
                contactInformationScreen
            } label: {
                Label("Confirm", systemImage: "chevron.forward")
                    .font(.headline)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 4)
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical, 32)
            .disabled(business.name.count < 3)
            
            Divider()
                .padding(.vertical)
            
            Text("The name is crucial for your business to be recognized. You will be able to change it later.")
                .foregroundStyle(.secondary)
                .font(.footnote)
        }
        .multilineTextAlignment(.center)
        .padding()
        .interactiveDismissDisabled()
    }
    
    // MARK: -
    
    private var contactInformationScreen: some View {
        ContentUnavailableView("Contact Information", systemImage: "person.crop.circle.fill.badge.plus")
            .navigationTitle(business.name)
    }
}

#Preview {
    NavigationStack {
        BusinessCreationScreen()
            .navigationTitle("this is empty")
            .navigationBarTitleDisplayMode(.inline)
    }
}
