//
//  HomeView.swift
//  TaskApp-CoreData
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results: FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            VStack(spacing: 0) {
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(.white)
                

                
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(results) { task in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(task.content ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text(task.date ?? Date(), style: .date)
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.black)
                            .contextMenu {
                                Button {
                                    vm.editItem(item: task)
                                } label: {
                                    Text("Edit")
                                }
                                
                                Button {
                                    context.delete(task)
                                    try! context.save()
                                } label: {
                                    Text("Delete")
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            
            Button {
                vm.isNewData.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(colors: [.orange, .pink], center: .center)
                    )
                    .clipShape(Circle())
            }
            .padding()
            
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea())
        .sheet(isPresented: $vm.isNewData) {
            NewData()
                .environmentObject(vm)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
