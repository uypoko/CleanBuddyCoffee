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

    func configure() -> UIViewController {
        let storyboard = UIStoryboard(name: "SetAddressOnMap", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SetAddressOnMapViewController") as! SetAddressOnMapViewController
        
        let router = SetAddressOnMapRouter()
        router.sourceView = view
        router.appBuilderDelegate = appBuilderDelegate
        
        let presenter = SetAddressOnMapPresenter()
        presenter.view = view
        presenter.router = router
        
        let interactor = SetAddressOnMapInteractor()
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        view.presenter = presenter
        
        return view
    }

}
