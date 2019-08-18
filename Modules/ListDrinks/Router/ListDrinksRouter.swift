//
//  ListDrinksListDrinksRouter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class ListDrinksRouter: ListDrinksRouterInput {
    
    weak var sourceView: ListDrinksViewController!
    
    func routeToDrinkDetail(drinkId: String) {
        let view = DrinkDetailViewController.instantiate(fromAppStoryboard: .DrinkDetail)
        DrinkDetailModuleConfigurator().configureModuleForViewInput(viewInput: view, drinkId: drinkId)
        sourceView.navigationController?.pushViewController(view, animated: true)
    }

}
