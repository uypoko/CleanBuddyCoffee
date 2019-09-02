//
//  ListDrinksListDrinksRouter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

// Naming -> dung lam tu dong.
class ListDrinksRouter(): ListDrinksRouterInput {
    
    // Weak?
    weak var sourceView: ListDrinksViewController!
    var appBuilderDelegate: AppBuilderDelegate!
    
    func routeToDrinkDetail(drinkId: String) {
        // Type?
        let destinationView = appBuilderDelegate.configureDrinkDetailModule(drinkId: drinkId)
        sourceView.navigationController?.pushViewController(destinationView, animated: true)
    }

}
