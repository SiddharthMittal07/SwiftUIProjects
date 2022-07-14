//
//  Serie.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 08/07/22.
//

import Foundation

struct Series: Codable {
    let data: SerieWrapper
}

struct SerieWrapper: Codable {
    let count: Int
    let results: [Serie]
}

struct Serie: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String?
    let urls: [Url]
    let startYear: Int
    let endYear: Int
    let rating: String?
    let thumbnail: Thumbnail
}
