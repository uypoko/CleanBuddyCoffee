//
//  DeliveryAddressDeliveryAddressViewInput.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

protocol DeliveryAddressViewInput: class {

    /**
        @author Ryan
        Setup initial state of the view
    */
    func displaySuccessOrderMessage()
    func displayErrorOrderMessage(error: Error)
}
