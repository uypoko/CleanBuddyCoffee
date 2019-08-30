//
//  DrinkDetailDrinkDetailConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 18/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DrinkDetailModuleConfigurator {
    
    let moduleDependency: ModuleDependency
    let appBuilderDelegate: AppBuilderDelegate
    
    init(moduleDependency: ModuleDependency, appBuilderDelegate: AppBuilderDelegate) {
        self.moduleDependency = moduleDependency
        self.appBuilderDelegate = appBuilderDelegate
    }

    func configure(drinkId: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "DrinkDetail", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DrinkDetailViewController") as! DrinkDetailViewController
        
        view.drinkId = drinkId
        let router = DrinkDetailRouter()
        router.sourceView = view
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = DrinkDetailPresenter()
        presenter.view = view
        presenter.router = router
        
        let interactor = DrinkDetailInteractor()
        interactor.output = presenter
        let remoteService = moduleDependency.remoteService
        interactor.remoteService = remoteService
        let localService =  moduleDependency.localService
        interactor.localService =  localService
        
        presenter.interactor = interactor
        view.output = presenter
        
        return view
    }

}
