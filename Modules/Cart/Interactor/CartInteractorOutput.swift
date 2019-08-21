//
//  CartCartInteractorOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol CartInteractorOutput: class {
    func didFetchCartItems(items: [Cart.ItemViewModel])
    func didDeleteItem(id: String)
    func didChangeItemQuantity(itemId: String, quantity: Int)
    func cartIsEmpty()
}
