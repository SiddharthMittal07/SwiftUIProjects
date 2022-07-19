//
//  ContentView.swift
//  TaskApp-CoreData
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
