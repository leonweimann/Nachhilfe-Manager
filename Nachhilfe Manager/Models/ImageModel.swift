//
//  ImageModel.swift
//  Nachhilfe Manager
//
//  Created by Leon Weimann on 26.09.24.
//

import SwiftData
import SwiftUI

@Model
class ImageModel {
    @Attribute(.preserveValueOnDeletion)
    var name: String = ""
    
    @Attribute(.externalStorage)
    var data: Data? = nil
    
    var image: UIImage? {
        get {
            guard let data else { return nil }
            return UIImage(data: data)
        }
        set {
            guard let data = newValue?.pngData() else { print("Failed converting image to data"); return }
            self.data = data
        }
    }
    
    // MARK: -
    
    init(name: String, data: Data?) {
        self.name = name
        self.data = data
    }
    
    convenience init(name: String, image: UIImage) throws {
        guard let data = image.pngData() else { throw URLError(.badURL) }
        self.init(name: name, data: data)
    }
    
    static func samples(for businessName: String = "SampleBusiness") -> [ImageModel] {
        [
            try! .init(
                name: createName(prefix: businessName, useCase: .icon),
                image: UIImage(named: "sampleBusinessLogoIcon")!
            ),
            try! .init(
                name: createName(prefix: businessName, useCase: .logo),
                image: UIImage(named: "sampleBusinessLogo")!
            )
        ]
    }
    
    static func createName(prefix businessName: String, useCase: UseCase) -> String {
        businessName.lowercased() + "*" + useCase.namingSuffix
    }
    
    // MARK: -
    
    enum UseCase {
        case logo, icon, named(String)
        
        var namingSuffix: String {
            switch self {
            case .logo: return "*logo"
            case .icon: return "*icon"
            case .named(let name): return "*\(name)"
            }
        }
    }
}
