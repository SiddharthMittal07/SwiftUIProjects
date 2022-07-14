//
//  Task.swift
//  TaskList
//
//  Created by Siddharth Mittal on 27/06/22.
//

import Foundation

struct Task: Identifiable {
    let id: String = UUID().uuidString
    var title: String
    var isComplete: Bool = false
    var description: String?
}
