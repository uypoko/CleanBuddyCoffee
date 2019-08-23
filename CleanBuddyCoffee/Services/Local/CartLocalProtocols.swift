//
//  CartLocalProtocols.swift
//  CleanBuddyCoffee
//
//  Created by Uy Cung Dinh on 8/20/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol GetCartItemsLocalService {
    func getCartItems() -> [CartItem]
}

protocol DrinkDetailModuleLocalCartService {
    func addItem(drinkId: String, quantity: Int)
}

protocol CartModuleLocalService {
    func changeItemQuantity(drinkId: String, quantity: Int)
    func removeItem(drinkId: String)
}

protocol DeliveryAddressModuleLocalService {
    func removeCartItems()
}

protocol AppLocalService {
    var archiveURL: URL { get }
    
    func encodeCart()
    func decodeCart()
}
