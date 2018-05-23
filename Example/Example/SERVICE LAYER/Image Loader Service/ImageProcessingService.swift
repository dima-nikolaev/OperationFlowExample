//
//  ImageProcessingService.swift
//  Example
//
//  Created by Dima on 5/19/18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import Foundation
import UIKit
import OperationFlow

protocol ImageProcessingService {
    
    func processImage(_ image: UIImage, completionHandler: @escaping (UIImage?) -> Void)
    
}

class ImageProcessingServiceImplementation {
    
    let coreImageFilterManager: CoreImageFilterManager
    
    init(coreImageFilterManager: CoreImageFilterManager) {
        self.coreImageFilterManager = coreImageFilterManager
        self.serviceQueue.qualityOfService = .userInitiated
    }
    
    private let serviceQueue = OperationQueue()
    
}

extension ImageProcessingServiceImplementation: ImageProcessingService {
    
    func processImage(_ image: UIImage, completionHandler: @escaping (UIImage?) -> Void) {
        guard let coreImage = CIImage(image: image) else {
            completionHandler(nil)
            return
        }
        let scaleImageOperation = ScaleImageOperation()
        let cropImageOperation = CropImageOperation()
        let filterImageOperation = FilterImageOperation(coreImageFilterManager: coreImageFilterManager)
        let operations = [
            scaleImageOperation,
            cropImageOperation,
            filterImageOperation
        ]
        
        let compoundOperation = CompoundOperation<CIImage, UIImage>(operations: operations, input: coreImage) { (filtredImage, error) in
            if let error = error {
                print(error)
            }
            completionHandler(filtredImage)
        }
        serviceQueue.addOperation(compoundOperation) // compoundOperation.start()
    }
    
}
