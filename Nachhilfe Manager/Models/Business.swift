//
//  Business.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 14.09.24.
//

import SwiftData

@Model
class Business {    
    var name: String = "businessNamePlaceholder"
    var eMail: String = "businessEMailPlaceholder"
    var phoneNumber: String = "businessPhoneNumberPlaceholder"
    var address: String = "businessAddressPlaceholder"
    var owner: String = "businessOwnerPlaceholder"
    
    @Relationship(.unique, deleteRule: .cascade)
    var customers: [Customer] = []
    
    init(name: String, eMail: String, phoneNumber: String, address: String, owner: String, customers: [Customer]) {
        self.name = name
        self.eMail = eMail
        self.phoneNumber = phoneNumber
        self.address = address
        self.owner = owner
        self.customers = customers
    }
    
    @MainActor
    static func sample() -> Business {
        .init(
            name: "Nachhilfe Leon Weimann",
            eMail: "nachhilfe@leonweimann.de",
            phoneNumber: "01785368576",
            address: "Friedhofstraße 11, 77963 Schwanau",
            owner: "Leon Weimann",
            customers: Customer.sample()
        )
    }
    
    @MainActor
    static func emptyInstance() -> Business {
        .init(
            name: "",
            eMail: "",
            phoneNumber: "",
            address: "",
            owner: "",
            customers: []
        )
    }
}
