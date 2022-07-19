//
//  TaskApp_CoreDataApp.swift
//  TaskApp-CoreData
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI

@main
struct TaskApp_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
