//
//  ListDrinksListDrinksRouter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class ListDrinksRouter: ListDrinksRouterInput {
    
    weak var sourceView: ListDrinksViewController!
    var appBuilderDelegate: AppBuilderDelegate!
    
    func routeToDrinkDetail(drinkId: String) {
        let destinationView = appBuilderDelegate.configureDrinkDetailModule(drinkId: drinkId)
        sourceView.navigationController?.pushViewController(destinationView, animated: true)
    }

}
