//
//  CoreAssembly.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

protocol CoreAssembly {
    
    var requestSender: RequestSender { get }
    var coreImageFilterManager: CoreImageFilterManager { get }
    
}

class CoreAssemblyImplementation: CoreAssembly {
    
    lazy var requestSender: RequestSender = RequestSenderImplementation()
    lazy var coreImageFilterManager: CoreImageFilterManager = CoreImageFilterManagerImplementation()
    
}
