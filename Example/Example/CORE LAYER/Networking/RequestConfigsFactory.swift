//
//  RequestsFactory.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

struct RequestConfigsFactory {
    
    struct ImageLoaderRequests {
        
        static func imageURLsLoaderConfig() -> RequestConfig<ImageURLsLoaderParser> {
            let request = ImageURLsLoaderRequest(apiKey: "8884171-7217886cca5fb99ba3bbd99f3")
            return RequestConfig<ImageURLsLoaderParser>(request: request, parser: ImageURLsLoaderParser())
        }
        
        static func imageLoaderConfig(imageURL: URL) -> RequestConfig<ImageLoaderParser> {
            let request = ImageLoaderRequest(imageURL: imageURL)
            return RequestConfig<ImageLoaderParser>(request: request, parser: ImageLoaderParser())
        }
        
    }
    
}
