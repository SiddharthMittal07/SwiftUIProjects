//
//  Destination.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import Foundation

struct Destination: Identifiable {
    let imageUrl: String
    let city: String
    let country: String
    let description: String
    let activities: [Activity]
    
    var id: String {
        city + country
    }
}
