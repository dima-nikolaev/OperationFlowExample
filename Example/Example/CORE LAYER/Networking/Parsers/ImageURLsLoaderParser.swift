//
//  ImagesLoaderParser.swift
//  Example
//
//  Created by Dima on 5/18/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import Foundation

class ImageURLsLoaderParser: Parser {
    
    typealias Model = [URL]
    
    func parse(data: Data) -> [URL]? {
        guard let hits = ((try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any])?["hits"] as? [[String: Any]] else { return nil }
        return hits.flatMap { (hit) -> [URL] in
            guard
                let path = hit["largeImageURL"] as? String,
                let url = URL(string: path) else { return [] }
            return [url]
        }
    }
    
}
