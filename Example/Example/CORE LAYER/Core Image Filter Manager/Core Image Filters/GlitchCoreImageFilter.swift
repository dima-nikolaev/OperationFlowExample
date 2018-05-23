//
//  GlitchCoreImageFilter.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation
import CoreImage

class GlitchCoreImageFilter: CIFilter {
    
    @objc dynamic var inputImage: CIImage?
    
    @objc dynamic var translationX = 9.0
    
    override var attributes: [String: Any] {
        return [
            kCIAttributeFilterDisplayName: "Glitch",
            
            "inputImage": [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "CIImage",
                kCIAttributeDisplayName: "Image",
                kCIAttributeType: kCIAttributeTypeImage
            ],
            
            "translationX": [
                kCIAttributeIdentity: 1,
                kCIAttributeClass: "NSNumber",
                kCIAttributeDefault: 9,
                kCIAttributeDisplayName: "Translation X",
                kCIAttributeType: kCIAttributeTypeScalar
            ]
        ]
    }
    
    private let kernelSource =
    """
    kernel vec4 glitch(sampler image, float tX) {
        vec2 destCoord = destCoord();
        vec4 s = sample(image, samplerTransform(image, destCoord));
        vec4 s2 = sample(image, samplerTransform(image, vec2(destCoord.x + tX, destCoord.y)));
        vec4 s3 = sample(image, samplerTransform(image, vec2(destCoord.x - tX, destCoord.y)));
        s2 = vec4(s2.r, 0, 0, 1);
        s3 = vec4(0, s3.g, s3.b, 1);
        vec4 s4 = vec4(s2.r+s3.r-s2.r*s3.r, s2.g+s3.g-s2.g*s3.g, s2.b+s3.b-s2.b*s3.b, 1);
        return vec4(s4.r+s.r-s4.r*s.r, s4.g+s.g-s4.g*s.g, s4.b+s.b-s4.b*s.b, 1);
    }
    """
    
    private lazy var kernel: CIKernel = {
        return CIKernel(source: kernelSource)!
    }()
    
    override var outputImage: CIImage? {
        guard let inputImage = inputImage else { return nil }
        return kernel.apply(extent: inputImage.extent, roiCallback: { (index, rect) -> CGRect in
            return rect
        }, arguments: [inputImage, translationX])
    }
    
}
