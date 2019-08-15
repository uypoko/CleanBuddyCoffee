//
//  ListDrinksListDrinksPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class ListDrinksPresenter: ListDrinksModuleInput, ListDrinksViewOutput, ListDrinksInteractorOutput {

    weak var view: ListDrinksViewInput!
    var interactor: ListDrinksInteractorInput!
    var router: ListDrinksRouterInput!
    
    func viewIsReady() {
        interactor.fetchProducts()
    }
    
    func didFetchDrinks(products: [ListDrinks.ProductResponse]) {
        var viewModels: [ListDrinks.ProductViewModel] = []
        for product in products {
            let viewModel = ListDrinks.ProductViewModel(name: product.name)
            viewModels.append(viewModel)
        }
        view.displayProducts(with: viewModels)
    }
}
