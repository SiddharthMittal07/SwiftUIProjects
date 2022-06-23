//
//  AddTask.swift
//  ToDoAppDemo
//
//  Created by Siddharth Mittal on 23/06/22.
//

import SwiftUI

struct AddTask: View {
    
    @EnvironmentObject var vm: ViewModel
    @State private var title: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("ADD TASK")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.semibold)
            
            TextField("Add task here...", text: $title)
                .textFieldStyle(.roundedBorder)
                .font(.title2)
            
            Button {
                if title != "" {
                    vm.addTask(task: Task(title: title))
                }
                
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(.blue)
                    .cornerRadius(15)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(red: 200, green: 225, blue: 0, opacity: 0.2).ignoresSafeArea())
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
            .environmentObject(ViewModel())
    }
}
