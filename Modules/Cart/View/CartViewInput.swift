//
//  CartCartViewInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

protocol CartViewInput: class {

    /**
        @author Ryan
        Setup initial state of the view
    */
    
    func displayCartItems(items: [Cart.ItemViewModel])
    func didDeleteItem(id: String)
    func didChangeItemQuantity(itemId: String, quantity: Int)
}
