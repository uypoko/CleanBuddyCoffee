//
//  SetAddressOnMapSetAddressOnMapInitializer.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 22/08/2019.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import UIKit

class SetAddressOnMapModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var setaddressonmapViewController: SetAddressOnMapViewController!

    override func awakeFromNib() {

        let configurator = SetAddressOnMapModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: setaddressonmapViewController)
    }

}
