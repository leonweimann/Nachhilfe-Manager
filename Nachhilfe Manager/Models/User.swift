//
//  User.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftUI

struct User: Codable, Identifiable {
    var id = UUID().uuidString
    var firstName: String = ""
    var lastName: String = ""
    var eMail: String = ""
    var phoneNumber: String = ""
    var address: String = ""
    
    var name: String { firstName + " " + lastName }
    
    static func sample() -> User {
        .init(
            firstName: "Leon",
            lastName: "Weimann",
            eMail: "leonweimann@icloud.com",
            phoneNumber: "0178 5368576",
            address: "Friedhofstraße 11, 77963 Schwanau"
        )
    }
}
