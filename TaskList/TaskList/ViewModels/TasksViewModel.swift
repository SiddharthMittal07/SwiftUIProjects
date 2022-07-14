//
//  TasksViewModel.swift
//  TaskList
//
//  Created by Siddharth Mittal on 27/06/22.
//

import Foundation
import SwiftUI

class TasksViewModel: ObservableObject {
    
    @Published private(set) var tasks: [Task] = []
    @Published var addAction: Bool = false
    @Published var editTask: Task?
    
    init() {
        tasks = [
            Task(title: "Do Laundry"),
            Task(title: "Play Basketball"),
            Task(title: "Do Homework"),
            Task(title: "Take a shower"),
            Task(title: "Go for a run"),
        ]
    }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func deleteTask(index: IndexSet) {
        withAnimation(.easeInOut) {
            tasks.remove(atOffsets: index)
        }
    }
    
    func toggleCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isComplete.toggle()
        }
        
        sortByCompletion()
    }
    
    func sortByCompletion() {
        withAnimation(.easeInOut) {
            tasks.sort { task1, task2 in
                if task1.isComplete {
                    return false
                } else if task2.isComplete {
                    return true
                }
                return false
            }
        }
    }
    
}
