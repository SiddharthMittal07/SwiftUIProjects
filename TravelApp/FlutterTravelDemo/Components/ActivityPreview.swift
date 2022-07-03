//
//  ActivityPreview.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import SwiftUI

struct ActivityPreview: View {
    
    let activity: Activity
    
    var body: some View {
        ZStack {
            Image(activity.imageUrl)
                .resizable()
                .frame(width: .infinity, height: 250)
                .cornerRadius(30)
                .overlay(LinearGradient(colors: [Color.black.opacity(0.2), Color.black.opacity(0.4), Color.black.opacity(0.5)], startPoint: .top, endPoint: .bottom).cornerRadius(30))
            
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Spacer()
                    ForEach(0..<activity.rating, id: \.self) { index in
                        Text("★")
                    }
                    .foregroundColor(.yellow)
                    .font(.title3)
                }
                
                Spacer()
                
                Text(activity.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    Text(activity.type)
                    Text("•")
                    Image(systemName: "ticket.fill")
                    Text("$" + String(format: "%.1f", activity.price))
                }
                .font(.title3)
            }
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 250)
    }
}

struct ActivityPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.red.ignoresSafeArea()
            
            ActivityPreview(activity: DataService.activities[1])
                .padding()
        }
    }
}
