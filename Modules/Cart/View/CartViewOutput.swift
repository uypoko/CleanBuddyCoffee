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

    func viewWillAppear()
    func deleteItemButtonTapped(id: String)
    func changeItemQuantityButtonTapped(itemId: String, quantity: Int)
    func confirmCartButtonTaped()
}
