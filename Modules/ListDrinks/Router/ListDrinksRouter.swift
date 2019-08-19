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
        let destination = DrinkDetailViewController.instantiate(fromAppStoryboard: .DrinkDetail)
        DrinkDetailModuleConfigurator().configureModuleForViewInput(viewInput: destination, drinkId: drinkId)
        sourceView.navigationController?.pushViewController(destination, animated: true)
    }

}
