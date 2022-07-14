//
//  MarvelAPISearchApp.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import SwiftUI

let publicKey = "INSERT_PUBLIC_KEY_HERE"
let privateKey = "INSERT_PRIVATE_KEY_HERE"

@main
struct MarvelAPISearchApp: App {
    
    @StateObject private var vm = CharactersViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
        }
    }
}
