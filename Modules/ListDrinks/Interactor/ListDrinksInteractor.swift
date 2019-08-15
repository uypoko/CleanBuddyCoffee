//
//  ListDrinksListDrinksInteractor.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class ListDrinksInteractor: ListDrinksInteractorInput {

    weak var output: ListDrinksInteractorOutput!
    var service: DrinkService?
    

    func fetchProducts() {
        var products: [ListDrinks.ProductResponse] = []
        service?.fetchDrinks { drinks in
            if let drinks = drinks {
                for drink in drinks {
                    let product = ListDrinks.ProductResponse(name: drink.name)
                    products.append(product)
                }
                self.output.didFetchDrinks(products: products)
            }
        }
    }
}
