//
//  ImageLoaderService.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation
import UIKit

protocol ImageLoaderService {
    
    func loadImageURLs(completionHandler: @escaping ([URL]?, String?) -> Void)
    func loadImage(at imageURL: URL, completionHandler: @escaping (UIImage?, String?) -> Void)
    
}

class ImageLoaderServiceImplementation {
    
    private let requestSender: RequestSender
    
    init(requestSender: RequestSender) {
        self.requestSender = requestSender
    }
    
}

extension ImageLoaderServiceImplementation: ImageLoaderService {
    
    func loadImageURLs(completionHandler: @escaping ([URL]?, String?) -> Void) {
        let requestConfig = RequestConfigsFactory.ImageLoaderRequests.imageURLsLoaderConfig()
        requestSender.send(requestConfig: requestConfig) { (result: Result<[URL]>) in
            switch result {
            case .success(let model):
                completionHandler(model, nil)
            case .error(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func loadImage(at imageURL: URL, completionHandler: @escaping (UIImage?, String?) -> Void) {
        let requestConfig = RequestConfigsFactory.ImageLoaderRequests.imageLoaderConfig(imageURL: imageURL)
        requestSender.send(requestConfig: requestConfig) { (result: Result<UIImage>) in
            switch result {
            case .success(let model):
                completionHandler(model, nil)
            case .error(let error):
                completionHandler(nil, error)
            }
        }
    }
    
}

