//
//  DataService.swift
//  TravelApp
//
//  Created by Siddharth Mittal on 28/06/22.
//

import Foundation

class DataService {
    
    static let hotels: [Hotel] = [
        Hotel(
            imageUrl: "hotel0",
            name: "Hotel 0",
            address: "404 Great St",
            price: 175
            ),
          Hotel(
            imageUrl: "hotel1",
            name: "Hotel 1",
            address: "404 Great St",
            price: 300
          ),
          Hotel(
            imageUrl: "hotel2",
            name: "Hotel 2",
            address: "404 Great St",
            price: 240
          )
    ]
    
    
    static let activities: [Activity] = [
        Activity(
            imageUrl: "stmarksbasilica",
            name: "St. Mark\"s Basilica",
            type: "Sightseeing Tour",
            startTimes: ["9:00 am", "11:00 am"],
            rating: 5,
            price: 30
          ),
          Activity(
            imageUrl: "gondola",
            name: "Walking Tour and Gonadola Ride",
            type: "Sightseeing Tour",
            startTimes: ["11:00 pm", "1:00 pm"],
            rating: 4,
            price: 210
          ),
          Activity(
            imageUrl: "murano",
            name: "Murano and Burano Tour",
            type: "Sightseeing Tour",
            startTimes: ["12:30 pm", "2:00 pm"],
            rating: 3,
            price: 125
          )
    ]
    
    
    static let destinations: [Destination] = [
        Destination(
            imageUrl: "venice",
            city: "Venice",
            country: "Italy",
            description: "Visit Venice for an amazing and unforgettable adventure.",
            activities: DataService.activities
          ),
          Destination(
            imageUrl: "paris",
            city: "Paris",
            country: "France",
            description: "Visit Paris for an amazing and unforgettable adventure.",
            activities: DataService.activities
          ),
          Destination(
            imageUrl: "newdelhi",
            city: "New Delhi",
            country: "India",
            description: "Visit New Delhi for an amazing and unforgettable adventure.",
            activities: DataService.activities
          ),
          Destination(
            imageUrl: "saopaulo",
            city: "Sao Paulo",
            country: "Brazil",
            description: "Visit Sao Paulo for an amazing and unforgettable adventure.",
            activities: DataService.activities
          ),
          Destination(
            imageUrl: "newyork",
            city: "New York City",
            country: "United States",
            description: "Visit New York for an amazing and unforgettable adventure.",
            activities: DataService.activities
          ),
    ]
    
}
