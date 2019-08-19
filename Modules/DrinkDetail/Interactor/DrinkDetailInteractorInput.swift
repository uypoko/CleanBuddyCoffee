//
//  DrinkDetailDrinkDetailInteractorInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol DrinkDetailInteractorInput {

    func fetchDrink(drinkId: String)
    func fetchDrinkImage(drinkId: String)
    func addToCart(drinkId: String, quantity: Int)
}
