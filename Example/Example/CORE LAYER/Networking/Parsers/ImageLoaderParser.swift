//
//  ImageLoaderParser.swift
//  Example
//
//  Created by Dima on 5/19/18.
//  hi@dimanikolaev.com
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//
    

import Foundation
import UIKit

class ImageLoaderParser: Parser {
    
    typealias Model = UIImage
    
    func parse(data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
}
