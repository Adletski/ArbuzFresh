//
//  Model.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 22.05.2023.
//

import Foundation

struct ResponseGrocery: Codable {
    let name, id: String
    let country: String
    let seasonal: String
    let weight: String
    let description: String
    let price: String
    let image: String
    let brand: String?
}

// MARK: - Price
struct Price: Codable {
    let priceDefault, formatted: String

    enum CodingKeys: String, CodingKey {
        case priceDefault = "default"
        case formatted
    }
}
