//
//  Creator.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 07/07/22.
//

import Foundation

struct Creators: Codable {
    let data: CreatorWrapper
}

struct CreatorWrapper: Codable {
    let count: Int
    let results: [Creator]
}

struct Creator: Identifiable, Codable {
    let id: Int
    let fullName: String
    let thumbnail: Thumbnail
}
