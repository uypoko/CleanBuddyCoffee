//
//  DrinkDetailDrinkDetailViewOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

protocol DrinkDetailViewOutput {

    /**
        @author Ryan
        Notify presenter that view is ready
    */

    func viewIsReady(drinkId: String)
    func addToCart(drinkId: String, quantity: Int)
}
