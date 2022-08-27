//
//  ProductViewModel.swift
//  OnLineStoreTask
//
//  Created by Gado on 26/08/2022.
//

import Foundation

struct Product: Codable {
    
    var name: String
    var price: Int
    var date: Date? = nil
    
}



class ProductViewModel {

    var products: [Product] = []
    let defaults = UserDefaults.standard
    var productsDidRefresh: (() -> Void)?

    func refreshProducts() {
        products = getDummyProducts()
        productsDidRefresh?()
    }
    
    func saveToUserDefaults(of products: [Product]){
        
        let encodedData = try? PropertyListEncoder().encode(products)
        defaults.set(encodedData, forKey: "cartProducts")

    }

}

private extension ProductViewModel {

    func getDummyProducts() -> [Product] {
        [
            Product(name: "TV", price: 42500),
            Product(name: "Mobile", price: 1500),
            Product(name: "Laptop", price: 500000),
            Product(name: "Joystick", price: 175)
        ]
    }
}
