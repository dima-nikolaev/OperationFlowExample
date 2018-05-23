//
//  ScaleImageOperation.swift
//  Example
//
//  Created by Dima on 20.05.18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import Foundation
import OperationFlow

class ScaleImageOperation: ChainableOperation<CIImage> {
    
    override func main() {
        let previousBuffer: (value: CIImage?, error: String?) = previousOperationBuffer()
        guard let inputImage = previousBuffer.value  else {
            error = "Scale operation error: input image's absence."
            return
        }
        let ratio = 410 / min(inputImage.extent.width, inputImage.extent.height)
        bufferValue = inputImage.transformed(by: CGAffineTransform(scaleX: ratio, y: ratio))
    }
    
}
