//
//  SetAddressOnMapSetAddressOnMapConfigurator.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 22/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class SetAddressOnMapModuleConfigurator {
    
    let moduleDependency: ModuleDependency
    let appBuilderDelegate: AppBuilderDelegate
    
    init(moduleDependency: ModuleDependency, appBuilderDelegate: AppBuilderDelegate) {
        self.moduleDependency = moduleDependency
        self.appBuilderDelegate = appBuilderDelegate
    }

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        guard let viewController = viewInput as? SetAddressOnMapViewController else { return }
        
        let router = SetAddressOnMapRouter()
        router.sourceView = viewController
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = SetAddressOnMapPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = SetAddressOnMapInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
