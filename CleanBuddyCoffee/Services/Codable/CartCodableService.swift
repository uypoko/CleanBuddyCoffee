//
//  CartCodableService.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/19/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

class CartCodableService: DrinkDetailModuleCodableCartService {
    
    private static var items: [CartItem] = []
    
    func addItem(drinkId: String, quantity: Int) {
        if let item = CartCodableService.items.first(where: {$0.id == drinkId}) {
            item.quantity += quantity
        } else {
            CartCodableService.items.append(CartItem(id: drinkId, quantity: quantity))
        }
    }
    
}

extension CartCodableService: CartModuleCodableService {
    
    func getItems() -> [CartItem] {
        return CartCodableService.items
    }
    
    func changeItemQuantity(drinkId: String, quantity: Int) {
        if let item = CartCodableService.items.first(where: {$0.id == drinkId}) {
            item.quantity = quantity
        }
    }
    
    func removeItem(drinkId: String) {
        if let item = CartCodableService.items.enumerated().first(where: {$0.element.id == drinkId}) {
            CartCodableService.items.remove(at: item.offset)
        }
    }
}

protocol DrinkDetailModuleCodableCartService: class {
    func addItem(drinkId: String, quantity: Int)
}

protocol CartModuleCodableService: class {
    func getItems() -> [CartItem]
    func changeItemQuantity(drinkId: String, quantity: Int)
    func removeItem(drinkId: String)
}
