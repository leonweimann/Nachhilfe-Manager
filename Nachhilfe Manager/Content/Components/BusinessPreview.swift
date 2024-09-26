//
//  BusinessPreview.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 15.09.24.
//

import SwiftUI

struct BusinessPreview: View {
    let business: Business
    
    var body: some View {
        HStack {
            if let image = business.image(for: .icon) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
            }
            
            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.headline)
                
                if let slogan = business.slogan {
                    Text(slogan)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "person")
                        .foregroundStyle(.tint)
                    
                    Text(business.customers.count, format: .number)
                }
                .font(.footnote)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    List {
        BusinessPreview(business: .sample())
    }
}
