//
//  Comic.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import Foundation

struct Comics: Codable {
    var data: ComicWrapper
}

struct ComicWrapper: Codable {
    var count: Int
    var results: [Comic]
}

struct Comic: Identifiable, Codable {
    var id: Int
    var title: String
    var issueNumber: Int
    var urls: [Url]
    var variantDescription: String
    var thumbnail: Thumbnail
    var description: String?
    
    var modifiedTitle: String {
        title.components(separatedBy: "(")[0]
    }
    
    var year: String {
        title.components(separatedBy: "(")[1].components(separatedBy: ")")[0]
    }
    
    var imageFound: Bool {
        if thumbnail.path.hasSuffix("image_not_available") {
            return false
        } else {
            return true
        }
    }
}
