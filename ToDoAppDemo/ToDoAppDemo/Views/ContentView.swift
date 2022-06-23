//
//  ContentView.swift
//  ToDoAppDemo
//
//  Created by Siddharth Mittal on 23/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: ViewModel = ViewModel()
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            Color(red: 200, green: 225, blue: 0, opacity: 0.2).ignoresSafeArea()
            
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 40) {
                    Text("MY TASKS")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        ForEach(vm.tasks) { task in
                            TaskRow(task: task)
                                .onTapGesture(count: 2) {
                                    vm.updateTasks(id: task.id)
                                }
                        }
                    }
            
                }
            }
            .padding()
            
            
            Button {
                // code to present sheet
                showSheet.toggle()
            } label: {
                Text("+")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().foregroundColor(.blue))
                    .padding(.horizontal)
            }
            
        }
        .sheet(isPresented: $showSheet) {
            AddTask()
        }
        .environmentObject(self.vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
