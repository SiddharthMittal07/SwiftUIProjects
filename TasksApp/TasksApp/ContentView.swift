//
//  ContentView.swift
//  TasksApp
//
//  Created by Siddharth Mittal on 26/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var task: String = ""
    @State private var tasks: [String] = ["Do Laundry", "Play Basketball", "Do Homework", "Sleep", "Shower", "Start Coding"]
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Tasks".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 15) {
                    TextField("Enter things to do...", text: $task)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity)
                    Button {
                        
                        if (!task.isEmpty) {
                            tasks.append(task)
                            UserDefaults.standard.setValue(tasks, forKey: "tasks")
                            task = ""
                        }
                        
                    } label: {
                        Text("Add Task")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach(tasks, id: \.self) {
                            Text($0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title3)
                                .padding()
                                .background(.white)
                                .cornerRadius(20)
                        }
                    }
                }
                .onAppear {
                    if let tasks = UserDefaults.standard.object(forKey: "tasks") {
                        self.tasks = tasks as! [String]
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
