//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
