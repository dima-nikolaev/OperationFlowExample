//
//  CoreImageFilterManager.swift.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation
import CoreImage

protocol CoreImageFilterManager {
    
    func processImage(_ coreImage: CIImage, withFilter filterName: String) -> CIImage
    func coreImageContext() -> CIContext
    
}

class CoreImageFilterManagerImplementation {
    
    init() {
        let filterConstructor = CoreImageFilterContstructor()
        CIFilter.registerName("Glitch",
                              constructor: filterConstructor,
                              classAttributes: [kCIAttributeFilterCategories: [kCICategoryDistortionEffect]])
    }
    
    private let context = CIContext(options: nil)
    
}

extension CoreImageFilterManagerImplementation: CoreImageFilterManager {
    
    func processImage(_ coreImage: CIImage, withFilter filterName: String) -> CIImage {
        return coreImage.applyingFilter(filterName)
    }
    
    func coreImageContext() -> CIContext {
        return context
    }
    
}


