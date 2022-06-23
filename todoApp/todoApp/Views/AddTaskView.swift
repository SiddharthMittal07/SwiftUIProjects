//
//  AddTaskView.swift
//  todoApp
//
//  Created by Siddharth Mittal on 23/06/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @State private var textFieldText: String = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
        
            TextField("Enter your task..", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
            
            Button {
                
                if textFieldText != "" {
                    realmManager.addTask(taskTitle: textFieldText)
                }
                
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .cornerRadius(15)
            }

            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
