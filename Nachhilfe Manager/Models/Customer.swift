//
//  Customer.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 13.09.24.
//

import SwiftData

@Model
class Customer {
    #Unique<Customer>([\.name, \.eMail, \.phoneNumber])
    
    @Attribute(.preserveValueOnDeletion)
    var name: String
    
    @Attribute(.preserveValueOnDeletion)
    var eMail: String
    
    @Attribute(.preserveValueOnDeletion)
    var phoneNumber: String
    
    var schoolType: SchoolType
    var schoolName: String?
    var billingAddress: String // Temp -> custom data model
    
    init(name: String, schoolType: SchoolType, eMail: String, phoneNumber: String, schoolName: String? = nil, billingAddress: String) {
        self.name = name
        self.schoolType = schoolType
        self.eMail = eMail
        self.phoneNumber = phoneNumber
        self.schoolName = schoolName
        self.billingAddress = billingAddress
    }
    
    @MainActor
    static func sample() -> [Customer] {
        [
            Customer(name: "John Doe", schoolType: .elementary, eMail: "john.doe@example.com", phoneNumber: "1234567890", schoolName: "Greenwood Elementary", billingAddress: "123 Main St, City A"),
            Customer(name: "Jane Smith", schoolType: .secondaryAdvanced, eMail: "jane.smith@example.com", phoneNumber: "0987654321", schoolName: "Highlands Secondary", billingAddress: "456 Elm St, City B"),
            Customer(name: "Alice Johnson", schoolType: .university, eMail: "alice.johnson@example.com", phoneNumber: "1122334455", schoolName: "Tech University", billingAddress: "789 Oak St, City C")
        ]
    }
}

enum SchoolType: Codable {
    case elementary, secondaryBasic, secondaryAdvanced, university
}
