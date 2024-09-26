//
//  PersistenceSelectionPropertyWrapper.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftData
import SwiftUI

@propertyWrapper @MainActor
struct PersistenceSelection<Model>: DynamicProperty where Model: PersistentModel {
    init(_ key: String) {
        self.key = key
    }
    
    var wrappedValue: Model? {
        get {
            guard let id else { return nil }
            return DataStoreClient.shared.model(for: id)
        }
        nonmutating set {
            UserDefaults.standard.set(newValue?.id, forKey: key)
        }
    }
    
    var projectedValue: Binding<Model?> {
        .init(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
    
    private let key: String
    
    var id: Model.ID? {
        get {
            guard let id = UserDefaults.standard.string(forKey: key) as? Model.ID else {
                guard let firstModelID = DataStoreClient.shared.fetch(for: Model.self).first?.id as? String else {
                    UserDefaults.standard.removeObject(forKey: key)
                    return nil
                }
                
                UserDefaults.standard.set(firstModelID, forKey: key)
                return firstModelID as? Model.ID
            }
            
            return id
        }
        nonmutating set {
            UserDefaults.standard.set(newValue as? String, forKey: key)
        }
    }
}
