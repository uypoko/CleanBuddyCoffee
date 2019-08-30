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
    
    func configure() -> UIViewController {
        let cartStoryboard = UIStoryboard(name: "Cart", bundle: nil)
        let cartNavigationController = cartStoryboard.instantiateViewController(withIdentifier: "CartNavigationController") as! UINavigationController
        let cartView = cartNavigationController.viewControllers[0] as! CartViewController
        
        let router = CartRouter()
        router.sourceView = cartView
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = CartPresenter()
        presenter.view = cartView
        presenter.router = router
        
        let interactor = CartInteractor()
        interactor.output = presenter
        interactor.localService = moduleDependency.localService
        interactor.remoteService = moduleDependency.remoteService
        
        presenter.interactor = interactor
        cartView.output = presenter
        
        return cartNavigationController
    }

}
