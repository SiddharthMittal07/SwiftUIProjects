//
//  Thumbnail.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import Foundation

struct Thumbnail: Codable {
    var path: String
    var ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}
