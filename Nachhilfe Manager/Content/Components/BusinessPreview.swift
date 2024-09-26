//
//  BusinessPreview.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 15.09.24.
//

import SwiftUI

struct BusinessPreview: View {
    let business: Business
    
    // MARK: -
    
    var body: some View {
        HStack(spacing: 16) {
            businessIcon
                .frame(width: 48, height: 48)
                .overlay(alignment: .topTrailing) {
                    businessFavoriteIndicator
                        .animation(.smooth, value: business.isFavorite)
                }
            
            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.headline)
                    .lineLimit(2)
                
                HStack {
                    sloganView
                    
                    Spacer()
                    
                    BusinessStatsIndicator(business.customers.count, symbol: "person.2")
                }
                .font(.footnote)
            }
        }
    }
    
    // MARK: -
    
    @ViewBuilder
    private var businessIcon: some View {
        if let image = business.image(for: .icon) {
            image
                .resizable()
                .scaledToFill()
        } else {
            Circle()
                .fill(.ultraThinMaterial)
                .overlay {
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
        }
    }
    
    @ViewBuilder
    private var businessFavoriteIndicator: some View {
        if business.isFavorite {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.yellow)
                .frame(width: 16, height: 16)
                .offset(x: 4, y: -4)
                .transition(.scale)
        }
    }
    
    @ViewBuilder
    private var sloganView: some View {
        if let slogan = business.slogan {
            Text(slogan)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(1)
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
