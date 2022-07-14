//
//  Algorithm.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import Foundation

struct Information: Codable {
    let main: String
    let applications: [String]
    let pros: [String]
    let cons: [String]
}

struct Algorithm: Identifiable, Codable {
    let algorithm: String
    let matrix: [[Int]]
    let information: Information
    
    enum CodingKeys: String, CodingKey {
        case algorithm, information
        case matrix = "confusion_matrix"
    }
    
    var id: String {
        algorithm
    }
}
