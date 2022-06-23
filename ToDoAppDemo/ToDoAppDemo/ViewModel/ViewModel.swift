//
//  ViewModel.swift
//  ToDoAppDemo
//
//  Created by Siddharth Mittal on 23/06/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published private(set) var tasks: [Task] = [
        Task(title: "Do Laundry"),
        Task(title: "Play Basketball"),
        Task(title: "Do Homework"),
        Task(title: "Design New App"),
        Task(title: "Create Website"),
        Task(title: "Workout"),
        Task(title: "Sleep"),
    ]
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func updateTasks(id: String) {
        let index = tasks.firstIndex { task in
            task.id == id
        }
        
        if let index = index {
            tasks[index].completed.toggle()
        }
    }
    
    func deleteTasks(id: String) {
        var newTasks: [Task] = []
        tasks.forEach { task in
            if (task.id != id) {
                newTasks.append(task)
            }
        }
        tasks = newTasks
    }
    
}
