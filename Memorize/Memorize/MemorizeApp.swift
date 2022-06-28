//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Siddharth Mittal on 27/06/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
