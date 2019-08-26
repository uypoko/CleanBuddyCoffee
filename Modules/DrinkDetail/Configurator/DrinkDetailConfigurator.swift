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

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, drinkId: String) {
        guard let viewController = viewInput as? DrinkDetailViewController else { return}
        
        viewController.drinkId = drinkId
        let router = DrinkDetailRouter()
        router.sourceView = viewController
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = DrinkDetailPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = DrinkDetailInteractor()
        interactor.output = presenter
        let remoteService = moduleDependency.remoteService
        interactor.remoteService = remoteService
        let localService =  moduleDependency.localService
        interactor.localService =  localService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
