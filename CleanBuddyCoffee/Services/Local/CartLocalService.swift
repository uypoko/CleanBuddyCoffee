//
//  CartCodableService.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/19/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

class CartLocalService {
    
    private static var items: [CartItem] = []
    
}

extension CartLocalService: GetCartItemsLocalService {
    func getCartItems() -> [CartItem] {
         return CartLocalService.items
    }
}

extension CartLocalService: DrinkDetailModuleLocalCartService {
    
    func addItem(drinkId: String, quantity: Int) {
        if let item = CartLocalService.items.first(where: {$0.id == drinkId}) {
            item.quantity += quantity
        } else {
            CartLocalService.items.append(CartItem(id: drinkId, quantity: quantity))
        }
    }
    
}

extension CartLocalService: CartModuleLocalService {
    
    func changeItemQuantity(drinkId: String, quantity: Int) {
        guard let index = CartLocalService.items.firstIndex(where: {$0.id == drinkId}) else { return }
        CartLocalService.items[index].quantity = quantity
    }
    
    func removeItem(drinkId: String) {
        guard let index = CartLocalService.items.firstIndex(where: {$0.id == drinkId}) else { return }
        CartLocalService.items.remove(at: index)
    }
}

extension CartLocalService: DeliveryAddressModuleLocalService {
    func removeCartItems() {
        CartLocalService.items.removeAll()
    }
}

extension CartLocalService: AppLocalService {
    var archiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("cart").appendingPathExtension("plist")
    }
    
    func encodeCart() {
        let propertyListEncoder = PropertyListEncoder()
        let encodedCart = try? propertyListEncoder.encode(CartLocalService.items)
        try? encodedCart?.write(to: archiveURL)
    }
    
    func decodeCart() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("cart").appendingPathExtension("plist")
        
        let propertyListDecoder = PropertyListDecoder()
        if let cartData = try? Data.init(contentsOf: archiveURL) {
            CartLocalService.items = (try? propertyListDecoder.decode(Array<CartItem>.self, from: cartData)) ?? []
        }
    }
}
