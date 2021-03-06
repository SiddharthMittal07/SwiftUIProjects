//
//  QueryTag.swift
//  VideoPlayer
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI

struct QueryTag: View {
    
    let query: Query
    let isSelected: Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: .nature, isSelected: true)
    }
}
