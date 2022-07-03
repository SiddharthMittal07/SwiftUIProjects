//
//  Hotel.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import Foundation

struct Hotel: Identifiable {
    let imageUrl: String
    let name: String
    let address: String
    let price: Double
    
    var id: String {
        name + address
    }
}
