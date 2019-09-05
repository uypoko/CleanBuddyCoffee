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
    
    init(moduleDependency: ModuleDependency) {
        self.moduleDependency = moduleDependency
    }
    
    func build() -> UIViewController {
        let mainTabBarView: UITabBarController = UITabBarController()
        
        // Home Tab
        let listDrinksConfigurator = ListDrinksModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        let listDrinksView = listDrinksConfigurator.configure()
        //Cart Tab
        let cartConfigurator = CartModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        let cartDrinksView = cartConfigurator.configure()
        
        mainTabBarView.viewControllers = [listDrinksView, cartDrinksView]
        return mainTabBarView
    }
    
}

extension AppBuilder: AppBuilderDelegate {
    func configureDrinkDetailModule(drinkId: String) -> UIViewController {
        let configurator = DrinkDetailModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        let view = configurator.configure(drinkId: drinkId)
        return view
    }
    
    func configureEnterDeliveryAddressModule() -> UIViewController {
        let configurator = DeliveryAddressModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        let view = configurator.configure()
        return view
    }
    
    func configureSetAddressOnMapModule() -> UIViewController {
        let configurator = SetAddressOnMapModuleConfigurator(moduleDependency: moduleDependency, appBuilderDelegate: self)
        let view = configurator.configure()
        return view
    }
}
