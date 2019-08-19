//
//  MainBuilder.swift
//  MultipleStoryboards
//
//  Created by Uy Cung Dinh on 8/13/19.
//  Copyright © 2019 Equity. All rights reserved.
//

import UIKit

struct MainBuilder {
    
    func buildModule() -> UIViewController {
        let mainView = MainViewController.instantiate(fromAppStoryboard: .Main)
        // Home Tab
        let listDrinksView = ListDrinksViewController.instantiate(fromAppStoryboard: .ListDrinks)
        let listDrinksNavigationController = UINavigationController(rootViewController: listDrinksView)
        let homeTabBarItem = UITabBarItem(title: "List", image: UIImage(named: "baseline_home_black_36pt"), selectedImage: nil)
        listDrinksNavigationController.tabBarItem = homeTabBarItem
        ListDrinksModuleConfigurator().configureModuleForViewInput(viewInput: listDrinksView)
        //Cart Tab
        let cartView = CartViewController.instantiate(fromAppStoryboard: .Cart)
        let cartNavigationController = UINavigationController(rootViewController: cartView)
        let cartTabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "baseline_shopping_cart_black_36pt"), selectedImage: nil)
        cartNavigationController.tabBarItem = cartTabBarItem
        CartModuleConfigurator().configureModuleForViewInput(viewInput: cartView)
        
        mainView.viewControllers = [listDrinksNavigationController, cartNavigationController]
        return mainView
    }
    
}
