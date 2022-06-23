//
//  Task.swift
//  ToDoAppDemo
//
//  Created by Siddharth Mittal on 23/06/22.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool = false

}
