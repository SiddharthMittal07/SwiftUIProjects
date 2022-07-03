//
//  Activity.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import Foundation

struct Activity: Identifiable {
    let imageUrl: String
    let name: String
    let type: String
    let startTimes: [String]
    let rating: Int
    let price: Double
    
    var id: String {
        name + type
    }
}
