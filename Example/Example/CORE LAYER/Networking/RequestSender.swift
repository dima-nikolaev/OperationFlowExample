//
//  RequestSender.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

enum Result<Model> {
    case success(Model)
    case error(String)
}

protocol RequestSender {
    func send<ParserImplementation>(requestConfig: RequestConfig<ParserImplementation>,
                                    completionHandler: @escaping(Result<ParserImplementation.Model>) -> Void)
}

class RequestSenderImplementation: RequestSender {
    
    let session = URLSession.shared
    
    func send<ParserImplementation>(requestConfig config: RequestConfig<ParserImplementation>,
                                    completionHandler: @escaping (Result<ParserImplementation.Model>) -> Void) {
        guard let urlRequest = config.request.urlRequest else {
            completionHandler(Result.error("url string can't be parsed to URL"))
            return
        }
        
        let task = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completionHandler(Result.error(error.localizedDescription))
                return
            }
            guard let data = data,
                let parsedModel: ParserImplementation.Model = config.parser.parse(data: data) else {
                    completionHandler(Result.error("received data can't be parsed"))
                    return
            }
            
            completionHandler(Result.success(parsedModel))
        }
        
        task.resume()
    }
}
