//
//  CartCartInteractorInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol CartInteractorInput {
    func getCartItems()
    func deleteItem(id: String)
    func changeItemQuantity(itemId: String, quantity: Int)
}
