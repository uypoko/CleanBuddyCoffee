//
//  SetAddressOnMapSetAddressOnMapPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 22/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class SetAddressOnMapPresenter: SetAddressOnMapViewOutput, SetAddressOnMapInteractorOutput {

    weak var view: SetAddressOnMapViewInput!
    var interactor: SetAddressOnMapInteractorInput!
    var router: SetAddressOnMapRouterInput!

    func viewIsReady() {

    }
}
