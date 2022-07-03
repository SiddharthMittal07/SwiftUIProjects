//
//  TravelTypeButton.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import SwiftUI

struct TravelTypeButton: View {
    
    let travelTypeButton: TravelType
    
    private let buttonDisabled: Color = Color.gray.opacity(0.3)
    private let buttonEnabled: Color = Color.blue.opacity(0.3)
    
    private let contentDisabled: Color = Color.white.opacity(0.5)
    private let contentEnabled: Color = Color.blue.opacity(0.8)
    
    private let contentScaleFactor = 0.3
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(travelTypeButton.isSelected ? buttonEnabled : buttonDisabled)
                
                Image(systemName: travelTypeButton.content)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * contentScaleFactor)
                    .foregroundColor(travelTypeButton.isSelected ? contentEnabled : contentDisabled)
            }
        }
    }
}

struct TravelTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        TravelTypeButton(travelTypeButton: TravelType(isSelected: false, content: "person.fill"))
            .frame(width: 65, height: 100)
    }
}
