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
    var owner: String = ""
    
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
    
    init(name: String, slogan: String?, eMail: String, phoneNumber: String, address: String, owner: String, isFavorite: Bool, customers: [Customer], images: [ImageModel]) {
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
            owner: "Leon Weimann",
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
            owner: "",
            isFavorite: false,
            customers: [],
            images: []
        )
    }
}
