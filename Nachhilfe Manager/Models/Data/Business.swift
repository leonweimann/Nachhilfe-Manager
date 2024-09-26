//
//  Business.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftData
import SwiftUI

@Model
class Business {
    @Attribute(.unique)
    var name: String = ""
    var slogan: String? = nil
    
    var eMail: String = ""
    var phoneNumber: String = ""
    var address: String = ""
    var owner: User = User() // Save only User.ID and fetch data from CloudKit servers (maybe only locally in beginning) -> Bei mehreren Unternehmen lässt sich User nicht zuverlässig synchronisieren. Zudem beim Teilen von Unternehmen geht das auch nicht. Vllt. bei Expansion der App daran denken, dass bei GmbH etc. kein User model infrage kommt..‚
    
    var isFavorite: Bool = false
    
    @Relationship(.unique, deleteRule: .cascade)
    var customers: [Customer] = []
    
    @Relationship(.unique, deleteRule: .cascade)
    var images: [ImageModel] = []
    
    // MARK: -
    
    func imageModel(for useCase: ImageModel.UseCase) -> ImageModel? {
        images
            .filter { image in
                image.name.hasSuffix(useCase.namingSuffix)
            }
            .first
    }
    
    func image(for useCase: ImageModel.UseCase) -> Image? {
        guard let image = imageModel(for: useCase)?.image else { return nil }
        return Image(uiImage: image)
    }
    
    // MARK: -
    
    init(name: String, slogan: String?, eMail: String, phoneNumber: String, address: String, owner: User, isFavorite: Bool, customers: [Customer], images: [ImageModel]) {
        self.name = name
        self.slogan = slogan
        self.eMail = eMail
        self.phoneNumber = phoneNumber
        self.address = address
        self.owner = owner
        self.isFavorite = isFavorite
        self.customers = customers
        self.images = images
    }
    
    @MainActor
    static func sample() -> Business {
        .init(
            name: "Nachhilfe Leon Weimann",
            slogan: "Deine Ziele - Unser Weg",
            eMail: "nachhilfe@leonweimann.de",
            phoneNumber: "07824 6190305",
            address: "Friedhofstraße 11, 77963 Schwanau",
            owner: .sample(),
            isFavorite: true,
            customers: Customer.sample(),
            images: ImageModel.samples(for: "Nachhilfe Leon Weimann")
        )
    }
    
    @MainActor
    static func emptyInstance() -> Business {
        .init(
            name: "",
            slogan: nil,
            eMail: "",
            phoneNumber: "",
            address: "",
            owner: .init(),
            isFavorite: false,
            customers: [],
            images: []
        )
    }
}
