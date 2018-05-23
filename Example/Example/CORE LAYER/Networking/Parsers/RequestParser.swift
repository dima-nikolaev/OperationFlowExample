//
//  RequestParser.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation


protocol Parser {
    associatedtype Model
    func parse(data: Data) -> Model?
}
