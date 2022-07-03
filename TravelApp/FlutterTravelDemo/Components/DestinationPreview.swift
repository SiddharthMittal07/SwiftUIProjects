//
//  DestinationPreview.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import SwiftUI

struct DestinationPreview: View {
    
    let destination: Destination
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomLeading) {
                    Image(destination.imageUrl)
                        .resizable()
                        .frame(height: geometry.size.height * 0.75)
                        .cornerRadius(20)
                        .overlay(
                            LinearGradient(colors: [Color.black.opacity(0.1), Color.black.opacity(0.2)], startPoint: .top, endPoint: .bottom).cornerRadius(20)
                        )
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(destination.city)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "location.fill")
                            Text(destination.country)
                        }
                    }
                    .padding(6)
                    .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text("\(destination.activities.count) Activities")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(destination.description)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
        }
        .frame(width: 220)
    }
}

struct DestinationPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            DestinationPreview(destination: DataService.destinations[0])
                .frame(height: 250)
        }
    }
}
