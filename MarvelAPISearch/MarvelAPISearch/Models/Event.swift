//
//  Event.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 07/07/22.
//

import Foundation

struct Events: Codable {
    let data: EventWrapper
}

struct EventWrapper: Codable {
    let count: Int
    let results: [Event]
}

struct Event: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let urls: [Url]
    let start: String?
    let end: String?
    let thumbnail: Thumbnail
}
