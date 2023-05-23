//
//  GroceryModel.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 22.05.2023.
//

import Foundation

class Grocery: Codable {
    let name, id: String
    let country: String
    let seasonal: String
    let weight: String
    let description: String
    let price: String
    let image: String
    let brand: String?
    var isProductAddedToCart: Bool
    var productCount: Int
    
    init(name: String, id: String, country: String, seasonal: String, weight: String, description: String, price: String, image: String, brand: String?, isProductAddedToCart: Bool, productCount: Int) {
        self.name = name
        self.id = id
        self.country = country
        self.seasonal = seasonal
        self.weight = weight
        self.description = description
        self.price = price
        self.image = image
        self.brand = brand
        self.isProductAddedToCart = isProductAddedToCart
        self.productCount = productCount
    }
}


typealias Groceries = [Grocery]
