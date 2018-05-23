//
//  ChainableOperation.swift
//  OperationFlow
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

open class ChainableOperation<Buffer>: Operation {
    
    public var bufferValue: Buffer?
    
    public func previousOperationBuffer<Buffer>() -> (value: Buffer?, error: String?) {
        guard let previousOperation = dependencies.first as? ChainableOperation<Buffer> else { return (nil, nil) }
        let value = previousOperation.bufferValue
        let error = previousOperation.error
        return (value, error)
    }
    
    public var error: String?
    
}
