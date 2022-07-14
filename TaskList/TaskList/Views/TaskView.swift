//
//  TaskView.swift
//  TaskList
//
//  Created by Siddharth Mittal on 27/06/22.
//

import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject private var vm: TasksViewModel
    let task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
            Text(task.title)
        }
        .onTapGesture(count: 2) {
            vm.toggleCompletion(task: task)
        }
        .onTapGesture {
            vm.editTask = task
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskView(task: Task(title: "Sample Test"))
            .padding()
            .previewLayout(.sizeThatFits)
            .environmentObject(TasksViewModel())
    }
}
