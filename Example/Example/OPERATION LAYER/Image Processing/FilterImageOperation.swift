//
//  FilterImageOperation.swift
//  Example
//
//  Created by Dima on 20.05.18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import Foundation
import OperationFlow

class FilterImageOperation: ChainableOperation<UIImage> {
    
    private let coreImageFilterManager: CoreImageFilterManager
    
    init(coreImageFilterManager: CoreImageFilterManager) {
        self.coreImageFilterManager = coreImageFilterManager
        super.init()
    }
    
    override func main() {
        let previousBuffer: (value: CIImage?, error: String?) = previousOperationBuffer()
        guard let inputImage = previousBuffer.value else {
            error = previousBuffer.error
            return
        }
        let filtredImage = coreImageFilterManager.processImage(inputImage, withFilter: "Glitch")
        if let coreGraphicsImage = coreImageFilterManager.coreImageContext().createCGImage(filtredImage,
                                                                                           from: filtredImage.extent) {
            bufferValue = UIImage(cgImage: coreGraphicsImage)
        } else {
            error = "Filter operation error: failed to create a core graphics representation of the core image."
        }
    }
    
}
