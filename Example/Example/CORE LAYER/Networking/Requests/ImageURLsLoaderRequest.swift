//
//  ImagesLoaderRequest.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

class ImageURLsLoaderRequest {
    
    private var baseUrl: String =  "https://pixabay.com/api/"
    private var command: String = "chart.gettoptracks"
    private let apiKey: String
    private var getParameters: [String: String]  {
        return ["key": apiKey,
                "editors_choice": "true",
                "per_page": "200"]
    }
    private var urlString: String {
        let getParams = getParameters.compactMap({ "\($0.key)=\($0.value)"}).joined(separator: "&")
        return baseUrl + "?" + getParams
    }
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
}

extension ImageURLsLoaderRequest: Request {
    
    var urlRequest: URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
    
}
