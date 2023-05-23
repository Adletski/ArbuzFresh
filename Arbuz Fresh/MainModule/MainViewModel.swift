//
//  MainViewModel.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 21.05.2023.
//

import Foundation

struct MainViewModel {
    
    var groceries: Groceries?
    var tempGroceries: Groceries = []
    
    mutating func initialize() {
        let groceries = [ResponseGrocery].parse(jsonFile: "data")
        guard let groceries = groceries else { return }
        self.groceries = groceries.map {
            Grocery(name: $0.name, id: $0.id, country: $0.country, seasonal: $0.seasonal, weight: $0.weight, description: $0.description, price: $0.price, image: $0.image, brand: $0.brand, isProductAddedToCart: false, productCount: 0)
        }
    }
    
}
