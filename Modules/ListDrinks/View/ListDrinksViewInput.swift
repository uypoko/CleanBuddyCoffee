//
//  ListDrinksListDrinksViewInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//
import Foundation

protocol ListDrinksViewInput: class {

    /**
        @author Ryan
        Setup initial state of the view
    */

    func displayProducts(with drinks: [ListDrinks.DrinkViewModel])
    func displayDrinkImage(for drinkName: String, data: Data)
    
}
