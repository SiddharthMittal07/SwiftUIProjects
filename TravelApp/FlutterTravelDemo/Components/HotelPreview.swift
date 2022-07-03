//
//  HotelPreview.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import SwiftUI

struct HotelPreview: View {
    
    let hotel: Hotel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(hotel.imageUrl)
                    .resizable()
                    .frame(height: geometry.size.height * 0.75)
                    .cornerRadius(20)
                    .overlay(
                        LinearGradient(colors: [Color.black.opacity(0.1), Color.black.opacity(0.2)], startPoint: .top, endPoint: .bottom).cornerRadius(20)
                    )
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(hotel.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(hotel.address)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 3) {
                        Image(systemName: "bed.double")
                        Text("$" + String(format: "%.1f", hotel.price))
                    }
                    .font(.body)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
        }
        .frame(width: 220)
    }
}

struct HotelPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.blue.ignoresSafeArea()
            
            HotelPreview(hotel: DataService.hotels.first!)
                .frame(height: 250)
        }
    }
}
