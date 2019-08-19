//
//  CartCartPresenter.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 19/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

class CartPresenter: CartModuleInput, CartViewOutput, CartInteractorOutput {

    weak var view: CartViewInput!
    var interactor: CartInteractorInput!
    var router: CartRouterInput!

    func viewIsReady() {

    }
}
