//
//  CartCodableService.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/19/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

class LocalService {
    
    private static var items: [CartItem] = []
    
}

extension LocalService: LocalServiceProtocol {
    func getCartItems() -> [CartItem] {
         return LocalService.items
    }
    
    func isItemInCart(id: String) -> Bool {
        return LocalService.items.contains(where: {$0.id == id})
    }
    
    func addExistingItem(drinkId: String, quantity: Int) {
        if let item = LocalService.items.first(where: {$0.id == drinkId}) {
            item.quantity += quantity
        }
    }
    
    func addNewItem(item: CartItem) {
        LocalService.items.append(item)
    }
    
    func changeItemQuantity(drinkId: String, quantity: Int) {
        guard let index = LocalService.items.firstIndex(where: {$0.id == drinkId}) else { return }
        LocalService.items[index].quantity = quantity
    }
    
    func removeItem(drinkId: String) {
        guard let index = LocalService.items.firstIndex(where: {$0.id == drinkId}) else { return }
        LocalService.items.remove(at: index)
    }
    
    func removeCartItems() {
        LocalService.items.removeAll()
    }
}

extension LocalService: AppLocalServiceProtocol {
    var archiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("cart").appendingPathExtension("plist")
    }
    
    func encodeCart() {
        let propertyListEncoder = PropertyListEncoder()
        let encodedCart = try? propertyListEncoder.encode(LocalService.items)
        try? encodedCart?.write(to: archiveURL)
    }
    
    func decodeCart() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("cart").appendingPathExtension("plist")
        
        let propertyListDecoder = PropertyListDecoder()
        if let cartData = try? Data.init(contentsOf: archiveURL) {
            LocalService.items = (try? propertyListDecoder.decode(Array<CartItem>.self, from: cartData)) ?? []
        }
    }
}
