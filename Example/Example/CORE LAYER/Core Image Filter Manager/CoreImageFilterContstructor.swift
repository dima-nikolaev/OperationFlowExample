//
//  CoreImageFilterContstructor.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation
import CoreImage

class CoreImageFilterContstructor: CIFilterConstructor {
    
    func filter(withName name: String) -> CIFilter? {
        switch name {
        case "Glitch":
            return GlitchCoreImageFilter()
        default:
            return nil
        }
    }
    
}
