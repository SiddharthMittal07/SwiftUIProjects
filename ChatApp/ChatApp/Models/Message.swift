//
//  Message.swift
//  ChatApp
//
//  Created by Siddharth Mittal on 19/07/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
