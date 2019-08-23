//
//  DeliveryAddressDeliveryAddressInitializer.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 20/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class DeliveryAddressModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var deliveryaddressViewController: DeliveryAddressViewController!

    override func awakeFromNib() {

        let configurator = DeliveryAddressModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: deliveryaddressViewController)
    }

}
