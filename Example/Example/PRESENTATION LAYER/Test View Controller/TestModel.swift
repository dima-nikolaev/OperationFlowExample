//
//  TestModel.swift
//  Example
//
//  Created by Dima on 5/19/18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import Foundation
import UIKit

protocol TestModel {
    
    var delegate: TestModelDelegate? { get set }
    func supplyNewImage()
    
}

protocol TestModelDelegate: class {
    var image: UIImage? { get set }
}

class TestModelImplementation: TestModel {
    
    private let imageLoaderService: ImageLoaderService
    private let imageProcessingService: ImageProcessingService
    
    init(imageLoaderService: ImageLoaderService, imageProcessingService: ImageProcessingService) {
        
        self.imageLoaderService = imageLoaderService
        self.imageProcessingService = imageProcessingService
        imageLoaderService.loadImageURLs { (imageURLs, error) in
            if let imageURLs = imageURLs {
                self.imageURLs = imageURLs
            } else if let error = error {
                print(error)
            }
        }
    }
    
    private var currentImageIndex = 0
    
    private var imageURLs = [URL]() {
        didSet {
            getNewImage(imageIndex: currentImageIndex)
        }
    }
    
    private func getNewImage(imageIndex: Int) {
        guard imageURLs.count > imageIndex else {
            currentImageIndex = 0
            return
        }
        let imageURL = imageURLs[imageIndex]
        currentImageIndex += 1
        imageLoaderService.loadImage(at: imageURL) { (image, error) in
            guard let image = image else {
                print(error ?? "Some unknown error occurred.")
                return
            }
            self.imageProcessingService.processImage(image) { (processedImage) in
                DispatchQueue.main.async {
                    self.delegate?.image = processedImage
                }
            }
        }
    }
    
    // MARK: TestModel
    
    weak var delegate: TestModelDelegate?
    
    func supplyNewImage() {
        getNewImage(imageIndex: currentImageIndex)
    }
    
}
