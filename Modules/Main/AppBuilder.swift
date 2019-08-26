//
//  MainBuilder.swift
//  MultipleStoryboards
//
//  Created by Uy Cung Dinh on 8/13/19.
//  Copyright © 2019 Equity. All rights reserved.
//

import UIKit

class AppBuilder {
    
    let moduleDependency: ModuleDependency
    
    init(localService: LocalServiceProtocol) {
        moduleDependency = ModuleDependency(localService: localService)
    }
    
    func build() -> UIViewController {
        let mainView = MainViewController.instantiate(fromAppStoryboard: .Main)
        // Home Tab
        let listDrinksView = ListDrinksViewController.instantiate(fromAppStoryboard: .ListDrinks)
        let listDrinksNavigationController = UINavigationController(rootViewController: listDrinksView)
        let homeTabBarItem = UITabBarItem(title: "List", image: UIImage(named: "baseline_home_black_36pt"), selectedImage: nil)
        listDrinksNavigationController.tabBarItem = homeTabBarItem
        ListDrinksModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self).configureModuleForViewInput(viewInput: listDrinksView)
        
        //Cart Tab
        let cartView = CartViewController.instantiate(fromAppStoryboard: .Cart)
        let cartNavigationController = UINavigationController(rootViewController: cartView)
        let cartTabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "baseline_shopping_cart_black_36pt"), selectedImage: nil)
        cartNavigationController.tabBarItem = cartTabBarItem
        CartModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self).configureModuleForViewInput(viewInput: cartView)
        
        mainView.viewControllers = [listDrinksNavigationController, cartNavigationController]
        return mainView
    }
    
}

extension AppBuilder: AppBuilderDelegate {
    func configureDrinkDetailModule(drinkId: String) -> DrinkDetailViewController {
        let view = DrinkDetailViewController.instantiate(fromAppStoryboard: .DrinkDetail)
        let configurator = DrinkDetailModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        configurator.configureModuleForViewInput(viewInput: view, drinkId: drinkId)
        return view
    }
    
    func configureEnterDeliveryAddressModule() -> DeliveryAddressViewController {
        let view = DeliveryAddressViewController.instantiate(fromAppStoryboard: .DeliveryAddress)
        let configurator = DeliveryAddressModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        configurator.configureModuleForViewInput(viewInput: view)
        return view
    }
    
    func configureSetAddressOnMapModule() -> SetAddressOnMapViewController {
        let view = SetAddressOnMapViewController.instantiate(fromAppStoryboard: .SetAddressOnMap)
        let configurator = SetAddressOnMapModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        configurator.configureModuleForViewInput(viewInput: view)
        return view
    }
}
