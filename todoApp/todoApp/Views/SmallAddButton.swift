//
//  SmallAddButton.swift
//  todoApp
//
//  Created by Siddharth Mittal on 23/06/22.
//

import SwiftUI

struct SmallAddButton: View {
    
    @Binding var showAddTaskView: Bool
    
    var body: some View {
        
        Button {
            showAddTaskView.toggle()
        } label: {
            ZStack {
                
                Circle()
                    .frame(width: 50)
                    .foregroundColor(.blue)
                
                Text("+")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
            }
            .frame(height: 50)
        }

        
    }
}
