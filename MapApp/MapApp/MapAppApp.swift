//
//  MapAppApp.swift
//  MapApp
//
//  Created by Siddharth Mittal on 26/06/22.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
