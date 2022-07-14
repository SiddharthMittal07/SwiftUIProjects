//
//  Cancer.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import Foundation

struct Cancer: Codable {
    let entity: String
    let year: Int
    let brainCancer: Double
    
    enum CodingKeys: String, CodingKey {
        case entity = "Entity"
        case year = "Year"
        case brainCancer = "Deaths - Brain and central nervous system cancer - Sex: Both - Age: All Ages (Number)"
    }
}
