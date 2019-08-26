//
//  CartCartConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class CartModuleConfigurator {

    let moduleDependency: ModuleDependency
    let appBuilderDelegate: AppBuilderDelegate
    
    init(moduleDependency: ModuleDependency, appBuilderDelegate: AppBuilderDelegate) {
        self.moduleDependency = moduleDependency
        self.appBuilderDelegate = appBuilderDelegate
    }
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        guard let viewController = viewInput as? CartViewController else { return }
        
        let router = CartRouter()
        router.sourceView = viewController
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = CartPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = CartInteractor()
        interactor.output = presenter
        interactor.localService = moduleDependency.localService
        interactor.remoteService = moduleDependency.remoteService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
