//
//  AppDependency.swift
//  CleanBuddyCoffee
//
//  Created by Ryan on 8/26/19.
//  Copyright © 2019 Daylighter. All rights reserved.
//

import Foundation

class ModuleDependency {
    
    let localService: LocalServiceProtocol
    let remoteService: RemoteServiceProtocol
    
    init(localService: LocalServiceProtocol) {
        self.localService = localService
        remoteService = RemoteService()
    }
    
}
