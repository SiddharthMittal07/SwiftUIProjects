//
//  SocialButton.swift
//  FoodApp
//
//  Created by Siddharth Mittal on 04/07/22.
//

import SwiftUI

struct SocialButton: View {
    
    let image: String
    let title: String
    let color: Color
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(7)
                    .background(.white)
                    .cornerRadius(5)
                Spacer()
                Spacer()
                Text("CONNECT WITH \(title.uppercased())")
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
            }
            .padding(9)
            .background(color)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct SocialButton_Previews: PreviewProvider {
    static var previews: some View {
        SocialButton(image: "facebook", title: "Facebook", color: Color.blue)
    }
}
