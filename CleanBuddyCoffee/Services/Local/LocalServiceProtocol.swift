//
//  CartLocalProtocols.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/20/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol LocalServiceProtocol {
    func getCartItems() -> [CartItem]
    func isItemInCart(id: String) -> Bool
    func addExistingItem(drinkId: String, quantity: Int)
    func addNewItem(item: CartItem)
    func changeItemQuantity(drinkId: String, quantity: Int)
    func removeItem(drinkId: String)
    func removeCartItems()
}

protocol AppLocalServiceProtocol {
    var archiveURL: URL { get }
    
    func encodeCart()
    func decodeCart()
}
