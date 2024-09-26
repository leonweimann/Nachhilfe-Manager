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
            id = newValue?.id
        }
    }
    
    var projectedValue: Binding<Model?> {
        .init(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
    
    private let key: String
    
    private var id: Model.ID? {
        get {
            if let storedID = UserDefaults.standard.string(forKey: key) as? Model.ID {
                return storedID
            }
            
            guard let firstModelID = DataStoreClient.shared.fetch(for: Model.self).first?.id as? Model.ID else {
                UserDefaults.standard.removeObject(forKey: key)
                return nil
            }
            
            UserDefaults.standard.set(firstModelID as? String, forKey: key)
            return firstModelID
        }
        nonmutating set {
            if let newID = newValue as? String {
                UserDefaults.standard.set(newID, forKey: key)
            } else {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
    }
}
