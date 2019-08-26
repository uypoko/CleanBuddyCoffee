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
    let coreDataStore: CoreDataStoreProtocol
    
    init(localService: LocalServiceProtocol, coreDataStore: CoreDataStoreProtocol) {
        self.localService = localService
        self.coreDataStore = coreDataStore
        remoteService = RemoteService()
    }
    
}
