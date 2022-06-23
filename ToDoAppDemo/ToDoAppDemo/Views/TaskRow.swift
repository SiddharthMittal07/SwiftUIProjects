//
//  TaskRow.swift
//  ToDoAppDemo
//
//  Created by Siddharth Mittal on 23/06/22.
//

import SwiftUI

struct TaskRow: View {
    
    var task: Task
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: task.completed ? "checkmark.circle" : "circle")
        
            Text(task.title)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: Task(title: "Do Laundry", completed: true))
    }
}
