//
//  ServiceAssembly.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

protocol ServiceAssembly {
    
    func makeImageLoaderService() -> ImageLoaderService
    func makeImageProcessingService() -> ImageProcessingService
    
}

class ServiceAssemblyImplementation {
    
    private let coreAssembly: CoreAssembly
    
    init(coreAssembly: CoreAssembly) {
        self.coreAssembly = coreAssembly
    }
    
}

extension ServiceAssemblyImplementation: ServiceAssembly {
    
    func makeImageLoaderService() -> ImageLoaderService {
        return ImageLoaderServiceImplementation(requestSender: coreAssembly.requestSender)
    }
    
    func makeImageProcessingService() -> ImageProcessingService {
        return ImageProcessingServiceImplementation(coreImageFilterManager: coreAssembly.coreImageFilterManager)
    }
    
}
