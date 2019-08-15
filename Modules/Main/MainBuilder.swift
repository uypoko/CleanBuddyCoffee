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
        
        let listDrinksView = ListDrinksViewController.instantiate(fromAppStoryboard: .ListDrinks)
        let listDrinksNavigationController = UINavigationController(rootViewController: listDrinksView)
        let homeTabBarItem = UITabBarItem(title: "List", image: UIImage(named: "baseline_home_black_36pt"), selectedImage: nil)
        listDrinksNavigationController.tabBarItem = homeTabBarItem
        ListDrinksModuleConfigurator().configureModuleForViewInput(viewInput: listDrinksView)
        
        mainView.viewControllers = [listDrinksNavigationController]
        return mainView
    }
    
}
