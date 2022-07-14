//
//  Result.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import Foundation

struct Result: Identifiable, Codable {
    let algorithm: String
    let accuracy: Double
    let time: Double
    let precision: Double
    let recall: Double
    
    enum CodingKeys: String, CodingKey {
        case algorithm, time
        case accuracy = "testing_accuracy"
        case precision = "precision_score"
        case recall = "recall_score"
    }
    
    var id: String {
        algorithm
    }
}
