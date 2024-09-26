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
        HStack(spacing: 16) {
            if let image = business.image(for: .icon) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
            }
            
            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.headline)
                    .lineLimit(2)
                
                HStack {
                    if let slogan = business.slogan {
                        Text(slogan)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    BusinessStatsIndicator(business.customers.count, symbol: "person.2")
                }
                .font(.footnote)
            }
        }
    }
    
    private func BusinessStatsIndicator(_ value: Int, symbol: String, color: Color = .accentColor) -> some View {
        HStack(spacing: 2) {
            Image(systemName: symbol)
                .foregroundStyle(color)
            
            Text(value, format: .number)
                .foregroundStyle(Color.secondary)
        }
        .font(.footnote)
    }
}

#Preview {
    List {
        BusinessPreview(business: .sample())
    }
}
