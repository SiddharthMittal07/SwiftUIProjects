//
//  ContentView.swift
//  todoApp
//
//  Created by Siddharth Mittal on 23/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            TasksView()
            
            SmallAddButton(showAddTaskView: $showAddTaskView)
                .padding()
            
        }
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .environmentObject(realmManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
