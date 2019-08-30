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

    func configure() -> UIViewController {
        let storyboard = UIStoryboard(name: "DeliveryAddress", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DeliveryAddressViewController") as! DeliveryAddressViewController
        
        let router = DeliveryAddressRouter()
        router.sourceView = view
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = DeliveryAddressPresenter()
        presenter.view = view
        presenter.router = router
        
        let interactor = DeliveryAddressInteractor()
        interactor.output = presenter
        interactor.localService = moduleDependency.localService
        interactor.remoteService = moduleDependency.remoteService
        
        presenter.interactor = interactor
        view.output = presenter
        
        return view
    }

}
