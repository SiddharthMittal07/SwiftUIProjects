//
//  AddTaskView.swift
//  TaskList
//
//  Created by Siddharth Mittal on 27/06/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject private var vm: TasksViewModel
    @State private var title: String = ""
    @State private var isComplete: Bool = false
    @State private var description: String = ""
    @State private var showAlert: Bool = false
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isTitleFocused: Bool
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.1).ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 40) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Task Title")
                            .font(.title2)
                        
                        TextField("Add task title here...", text: $title)
                            .textFieldStyle(.roundedBorder)
                            .focused($isTitleFocused)
                    }
                    
                    Toggle(isOn: $isComplete) {
                        Text("Task Complete?")
                            .font(.title2)
                    }
                    .tint(.green)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Task Description (Optional)")
                            .font(.title2)
                        
                        TextField("Describe the task...", text: $description)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button {
                        
                        if !title.isEmpty {
                            let task = Task(title: title, isComplete: isComplete, description: description.isEmpty ? nil : description)
                            vm.addTask(task: task)
                            dismiss()
                        } else {
                            showAlert.toggle()
                        }
                        
                    } label: {
                        Text("ADD TASK")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationTitle("ADD TASK")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("No Title Provided"), message: Text("Please provide title for the task! It is necessary!"), dismissButton: Alert.Button.destructive(Text("Cancel"), action: {
                    isTitleFocused = true
                }))
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
        }
        .environmentObject(TasksViewModel())
    }
}
