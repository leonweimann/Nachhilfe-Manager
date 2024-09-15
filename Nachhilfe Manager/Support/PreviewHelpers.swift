//
//  PreviewHelpers.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 13.09.24.
//

import SwiftData
import SwiftUI

// MARK: -

struct SampleDataPreviewModifier: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        DataStoreClient.makeModelContainer(with: .mocked)
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleDataPreviewModifier())
}

// MARK: -

struct EmptyDataPreviewModifier: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        DataStoreClient.makeModelContainer(with: .mocked, empty: true)
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var emptyData: Self = .modifier(EmptyDataPreviewModifier())
}
