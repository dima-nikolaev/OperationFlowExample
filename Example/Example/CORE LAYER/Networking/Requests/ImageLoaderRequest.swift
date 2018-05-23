//
//  ImageLoaderRequest.swift
//  Example
//
//  Created by Dima on 5/19/18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import Foundation

class ImageLoaderRequest {
    
    private let imageURL: URL
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }
    
}

extension ImageLoaderRequest: Request {
    
    var urlRequest: URLRequest? {
        return URLRequest(url: imageURL)
    }
    
}
