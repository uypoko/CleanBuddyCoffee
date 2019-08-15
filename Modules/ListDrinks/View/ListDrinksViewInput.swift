//
//  ListDrinksListDrinksViewInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

protocol ListDrinksViewInput: class {

    /**
        @author Ryan
        Setup initial state of the view
    */

    func setupInitialState()
    func displayProducts(with products: [ListDrinks.ProductViewModel])
}
