//
//  TaskListApp.swift
//  TaskList
//
//  Created by Siddharth Mittal on 27/06/22.
//

import SwiftUI

@main
struct TaskListApp: App {
    
    @StateObject private var vm = TasksViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(vm)
        }
    }
}
