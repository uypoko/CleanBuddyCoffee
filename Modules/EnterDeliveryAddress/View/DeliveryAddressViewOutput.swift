//
//  DeliveryAddressDeliveryAddressViewOutput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

protocol DeliveryAddressViewOutput {

    /**
        @author Ryan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func placeOrderButtonTapped(email: String, name: String, phone: String, address: String)
    func didShowOrderSuccessMessage()
    func setAddressOnMapButtonTapped()
}
