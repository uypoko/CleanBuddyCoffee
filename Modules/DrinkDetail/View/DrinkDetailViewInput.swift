//
//  DrinkDetailDrinkDetailViewInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//
import Foundation

protocol DrinkDetailViewInput: class {

    /**
        @author Ryan
        Setup initial state of the view
    */

    func displayDrink(drink: DrinkDetail.DrinkViewModel)
    func displayDrinkImage(data: Data)
    
}
