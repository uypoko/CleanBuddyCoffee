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
    
    init(moduleDependency: ModuleDependency, appBuilderDelegate: AppBuilderDelegate) {
        self.moduleDependency = moduleDependency
        self.appBuilderDelegate = appBuilderDelegate
    }
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        guard let viewController = viewInput as? ListDrinksViewController else { return }
        
        let router = ListDrinksRouter()
        router.sourceView = viewController
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = ListDrinksPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = ListDrinksInteractor()
        interactor.output = presenter
        interactor.remoteService = moduleDependency.remoteService
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
