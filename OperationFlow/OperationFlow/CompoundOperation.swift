//
//  CompoundOperation.swift
//  OperationFlow
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

public class CompoundOperation<Input, Output>: Operation {
    
    public let finishBlock: ((Output?, String?) -> Void)?
    
    private let operations: [Operation]
    
    public init(operations: [Operation], input: Input, finishBlock: ((Output?, String?) -> Void)?) {
        let initialOperation = ChainableOperation<Input>()
        initialOperation.bufferValue = input
        let allOperations = [initialOperation] + operations
        
        for (index, operation) in allOperations.enumerated() {
            let nextOperationIndex = index + 1
            guard nextOperationIndex < allOperations.count else { break }
            let nextOperation = allOperations[nextOperationIndex]
            nextOperation.addDependency(operation)
        }
        
        self.operations = allOperations
        self.finishBlock = finishBlock
        
        super.init()
    }
    
    public func lastOperationBuffer<Buffer>() -> (value: Buffer?, error: String?) {
        guard let lastOperation = operations.last as? ChainableOperation<Buffer> else { return (nil, nil) }
        let value = lastOperation.bufferValue
        let error = lastOperation.error
        return (value, error)
    }
    
    public override func main() {
        operations.forEach { (operation) in
            operation.start()
        }
        let buffer: (value: Output?, error: String?) = lastOperationBuffer()
        let value = buffer.value
        let error = buffer.error
        finishBlock?(value, error)
    }
    
}

