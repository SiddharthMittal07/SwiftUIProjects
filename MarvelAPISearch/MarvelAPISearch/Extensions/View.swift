//
//  View.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import Foundation
import SwiftUI

extension View {
    func extractImageURL(path: String, ext: String) -> String {
        let index = path.index(path.startIndex, offsetBy: 4)
        return "https" + String(path[index...]) + "." + ext
    }
}
