//
//  DrinkDetailDrinkDetailInteractorOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol DrinkDetailInteractorOutput: class {

    func didFetchDrink(drink: DrinkDetail.Drink)
    func didFetchDrinkImage(data: Data)
    
}
