//
//  CartCartViewOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

protocol CartViewOutput {

    /**
        @author Ryan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func deleteItem(id: String)
    func changeItemQuantity(itemId: String, quantity: Int)
}
