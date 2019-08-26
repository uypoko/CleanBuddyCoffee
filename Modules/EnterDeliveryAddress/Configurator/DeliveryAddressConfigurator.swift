//
//  DeliveryAddressDeliveryAddressConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DeliveryAddressModuleConfigurator {
    
    let moduleDependency: ModuleDependency
    let appBuilderDelegate: AppBuilderDelegate
    
    init(moduleDependency: ModuleDependency, appBuilderDelegate: AppBuilderDelegate) {
        self.moduleDependency = moduleDependency
        self.appBuilderDelegate = appBuilderDelegate
    }

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        guard let viewController = viewInput as? DeliveryAddressViewController else { return }
        
        let router = DeliveryAddressRouter()
        router.sourceView = viewController
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = DeliveryAddressPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = DeliveryAddressInteractor()
        interactor.output = presenter
        interactor.localService = moduleDependency.localService
        interactor.remoteService = moduleDependency.remoteService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
