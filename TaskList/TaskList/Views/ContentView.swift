//
//  ContentView.swift
//  TaskList
//
//  Created by Siddharth Mittal on 27/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var vm: TasksViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
                Color.white.opacity(0.1).ignoresSafeArea()
                
                List {
                    ForEach(vm.tasks) { task in
                        TaskView(task: task)
                    }
                    .onDelete { indexSet in
                        vm.deleteTask(index: indexSet)
                    }
                }
                
                HStack {
                    Spacer()
                    NavigationLink {
                        AddTaskView()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 44, weight: .semibold))
                    }
                }
                .padding()
            }
            .navigationTitle("TASKS")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddTaskView()
                    } label: {
                        Text("Add")
                    }
                }
            }
            .sheet(item: $vm.editTask, onDismiss: nil) { task in
                Text("Edit Task")
            }
            .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        .environmentObject(TasksViewModel())
    }
}
