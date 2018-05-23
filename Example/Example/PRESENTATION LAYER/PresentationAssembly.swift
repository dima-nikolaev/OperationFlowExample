//
//  PresentationAssembly.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

protocol PresentationAssembly {
    
    func makeTestViewController() -> TestViewController
    
}

class PresentationAssemblyImplementation {
    
    private let serviceAssembly: ServiceAssembly
    
    init(serviceAssembly: ServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
}

extension PresentationAssemblyImplementation: PresentationAssembly {
    
    func makeTestViewController() -> TestViewController {
        var testModel = makeTestModel()
        let testViewController = TestViewController(model: testModel)
        testModel.delegate = testViewController
        return testViewController
    }
    
}

extension PresentationAssemblyImplementation {
    
    private func makeTestModel() -> TestModel {
        return TestModelImplementation(imageLoaderService: serviceAssembly.makeImageLoaderService(),
                                       imageProcessingService: serviceAssembly.makeImageProcessingService())
    }
    
}
