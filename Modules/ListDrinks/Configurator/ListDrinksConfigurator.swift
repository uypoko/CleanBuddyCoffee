//
//  ListDrinksListDrinksConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 15/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class ListDrinksModuleConfigurator {
    
    let moduleDependency: ModuleDependency
    let appBuilderDelegate: AppBuilderDelegate
    
    // only pass what is needed
    init(moduleDeependency: ModuleDependency, appBuilderDelegate: AppBuilderDelegate) {
        self.moduleDependency = moduleDependency
        self.appBuilderDelegate = appBuilderDelegate
    }
    
    func configure() -> UIViewController {
        let listDrinksStoryboard = UIStoryboard(name: "ListDrinks", bundle: nil)
        let listDrinksNavigationController = listDrinksStoryboard.instantiateViewController(withIdentifier: "ListDrinksNavigationController") as! UINavigationController
        
        // type
        // What huy?
        let listDrinksView: ListDrinksViewController = listDrinksNavigationController.viewControllers[0] as! ListDrinksViewController
        
        let router = ListDrinksRouter()
        router.sourceView = listDrinksView
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = ListDrinksPresenter()
        presenter.view = listDrinksView
        presenter.router = router
        
        let interactor = ListDrinksInteractor()
        interactor.output = presenter
        interactor.remoteService = moduleDependency.remoteService
        presenter.interactor = interactor
        listDrinksView.output = presenter
        
        return listDrinksNavigationController
    }

}
