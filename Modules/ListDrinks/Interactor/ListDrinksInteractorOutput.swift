//
//  ListDrinksListDrinksInteractorOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

protocol ListDrinksInteractorOutput: class {
    func didFetchDrinks(products: [Product])
}
