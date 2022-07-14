//
//  Developer.swift
//  Project
//
//  Created by Siddharth Mittal on 10/07/22.
//

import Foundation
import SwiftUI

class Developer {
    static let instance = Developer()
    
    private init() { }
    
    let devAlgorithm = Algorithm(algorithm: "Logistic Regression",
                                 matrix: [[105,0],[51,238]],
                                 information: Information(main: "It’s a classification algorithm, that is used where the response variable is categorical. The idea of Logistic Regression is to find a relationship between features and probability of particular outcome.",
                                                          applications: ["Qualify Leads","Recommend Products","Anticipate rare customer behavior"],
                                                          pros: ["Simple and Efficient","Low Variance","It provides probability score for observations"],
                                                          cons: ["Doesn't handle large number of categorical features/variables well","It requires transformation of non-linear features"]
                                                         )
                        )
    
    let devResult = Result(algorithm: "Decision Trees",
                           accuracy: 0.8376722817764165,
                           time: 0.08507418632507324,
                           precision: 0.8500785779723781,
                           recall: 0.8369716980345494
                    )
}

extension PreviewProvider {
    
    static var dev: Developer {
        Developer.instance
    }
    
}
