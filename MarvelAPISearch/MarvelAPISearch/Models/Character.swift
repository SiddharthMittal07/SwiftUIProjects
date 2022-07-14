//
//  Character.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import Foundation

struct Characters: Codable {
    var data: CharacterWrapper
}

struct CharacterWrapper: Codable {
    var count: Int
    var results: [Character]
}

struct Character: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: Thumbnail
    var urls: [Url]
    
    var imageFound: Bool {
        if thumbnail.path.hasSuffix("image_not_available") {
            return false
        } else {
            return true
        }
    }
}
