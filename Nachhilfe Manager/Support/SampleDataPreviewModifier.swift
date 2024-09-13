//
//  SampleDataPreviewModifier.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 13.09.24.
//

import SwiftData
import SwiftUI

struct SampleDataPreviewModifier: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true, cloudKitDatabase: .none)
        let container = try ModelContainer(for: Customer.self, configurations: config)
        Customer.makeSampleData(in: container)
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleDataPreviewModifier())
}
