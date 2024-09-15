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
        VStack {
            Text(business.name)
                .font(.headline)
        }
    }
}

#Preview {
    BusinessPreview(business: .sample())
}
