//
//  CartViewModel.swift
//  OnLineStoreTask
//
//  Created by Gado on 26/08/2022.
//

import Foundation


class CartViewModel {
    
    
    let defaults = UserDefaults.standard
    var cartProducts = [Product]()
    var filteredCartProducts = [Product]()
    var productsDidRefresh: (() -> Void)?

    func refreshProducts() {
        readDataFromUserDefaults()
        filterLatestAddedProducts(of: cartProducts)
        productsDidRefresh?()
    }
    
    
    func readDataFromUserDefaults() {
        
        guard let decoded  = defaults.object(forKey: "cartProducts") else { return }
        
        let decodedProducts = try? PropertyListDecoder().decode([Product].self, from: decoded as! Data)
        print(decodedProducts as Any)
        cartProducts = decodedProducts ?? [Product]()
        
    }
    
    func filterLatestAddedProducts(of products: [Product]) {
        let beforeThereDays = Calendar.current.date(byAdding: .day, value: -3, to: Date())
        filteredCartProducts = products.filter{$0.date! > beforeThereDays!}
    }
    
    
}
