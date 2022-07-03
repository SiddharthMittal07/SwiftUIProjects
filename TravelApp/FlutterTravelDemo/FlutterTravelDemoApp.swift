//
//  FlutterTravelDemoApp.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import SwiftUI

@main
struct FlutterTravelDemoApp: App {
    
    @StateObject private var vm = TravelViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(vm)
            }
        }
    }
}
