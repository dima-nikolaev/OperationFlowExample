//
//  CropImageOperation.swift
//  Example
//
//  Created by Dima on 20.05.18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import Foundation
import OperationFlow

class CropImageOperation: ChainableOperation<CIImage> {
    
    override func main() {
        let previousBuffer: (value: CIImage?, error: String?) = previousOperationBuffer()
        guard let inputImage = previousBuffer.value else {
            error = previousBuffer.error
            return
        }
        bufferValue = inputImage.cropped(to: CGRect(x: (inputImage.extent.width-410)/2,
                                                    y: (inputImage.extent.height - 410)/2,
                                                    width: 410,
                                                    height: 410))
    }
    
}

