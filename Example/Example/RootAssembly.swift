//
//  RootAssembly.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

class RootAssembly {
    
    lazy var presentationAssembly: PresentationAssembly = PresentationAssemblyImplementation(serviceAssembly: serviceAssembly)
    private lazy var serviceAssembly: ServiceAssembly = ServiceAssemblyImplementation(coreAssembly: coreAssembly)
    private lazy var coreAssembly: CoreAssembly = CoreAssemblyImplementation()
    
}
