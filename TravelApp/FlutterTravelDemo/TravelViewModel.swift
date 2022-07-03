//
//  TravelViewModel.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import Foundation
import SwiftUI

class TravelViewModel: ObservableObject {
    
    @Published private(set) var hotels: [Hotel] = []
    @Published private(set) var destinations: [Destination] = []
    @Published private(set) var activities: [Activity] = []
    @Published private(set) var travelTypes: [TravelType] = []
    
    init() {
        
        self.hotels = DataService.hotels
        self.destinations = DataService.destinations
        self.activities = DataService.activities
        self.travelTypes = [
            TravelType(isSelected: true, content: "airplane.departure"),
            TravelType(isSelected: false, content: "car"),
            TravelType(isSelected: false, content: "figure.walk"),
            TravelType(isSelected: false, content: "bicycle")
        ]
    }
    
    func chooseTravelFilter(travelTypeButton: TravelType) {
        
        for index in travelTypes.indices {
            travelTypes[index].isSelected = false
        }
        
        if let index = travelTypes.firstIndex(where: { $0.content == travelTypeButton.content }) {
            travelTypes[index].isSelected.toggle()
        }
        
    }
    
}
