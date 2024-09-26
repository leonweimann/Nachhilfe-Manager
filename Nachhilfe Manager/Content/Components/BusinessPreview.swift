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
            
            VStack {
                Text(business.name)
                    .font(.headline)
                
                
            }
        }
    }
}

#Preview(traits: .sampleData) {
    List {
        BusinessPreview(business: .sample())
    }
}
