//
//  NewData.swift
//  TaskApp-CoreData
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI

struct NewData: View {
    @EnvironmentObject var vm: HomeViewModel
    @Environment(\.managedObjectContext) var context
    var body: some View {
        VStack {
            HStack {
                Text("Add New Task")
                    .font(.system(size: 65))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Spacer(minLength: 0)
            }
            .padding()
            
            TextEditor(text: $vm.content)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 10) {
                DateButton(title: "Today")
                DateButton(title: "Tomorrow")
                DatePicker("", selection: $vm.date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            
            Button {
                vm.writeData(context: context)
            } label: {
                Label("Add Now", systemImage: "plus")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(
                LinearGradient(colors: [.orange,.pink], startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(8)
            .padding()
            .disabled(vm.content.isEmpty)
            .opacity(vm.content.isEmpty ? 0.5 : 1)
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea())
    }
}

struct NewData_Previews: PreviewProvider {
    static var previews: some View {
        NewData()
            .environmentObject(HomeViewModel())
    }
}
