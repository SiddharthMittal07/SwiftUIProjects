//
//  HomeViewModel.swift
//  TaskApp-CoreData
//
//  Created by Siddharth Mittal on 19/07/22.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    @Published var isNewData = false
    let calendar = Calendar.current
    
    func checkDate() -> String {
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other Day"
        }
    }
    
    func updateDate(value: String) {
        if value == "Today" {
            date = Date()
        } else if value == "Tomorrow" {
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        } else {
            // Do something
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        do {
            try context.save()
            isNewData.toggle()
            content = ""
            date = Date()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editItem(item: Task) {
        // do something
    }
}
