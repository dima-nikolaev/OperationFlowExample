//
//  RequestConfig.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

struct RequestConfig<ParserImplementation> where ParserImplementation: Parser {
    let request: Request
    let parser: ParserImplementation
}
