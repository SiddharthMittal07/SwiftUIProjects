//
//  DestinationView.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 02/07/22.
//

import SwiftUI

struct DestinationView: View {
    
    let destination: Destination
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                header
                
                Text(destination.description)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(15)
                    .padding()
                
                HStack(alignment: .center) {
                    Text("Points of Interests")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("See All")
                    }
                }
                .padding(.horizontal)
                
                VStack {
                    ForEach(destination.activities) { activity in
                        HStack(alignment: .center, spacing: 5) {
                            Image(activity.imageUrl)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .cornerRadius(20)
                            Spacer()
                            VStack(alignment: .leading, spacing: 5) {
                                Text(activity.name)
                                    .font(.headline)
                                Text(activity.type)
                                HStack(spacing: 2) {
                                    ForEach(0..<activity.rating, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                                HStack {
                                    Image(systemName: "ticket")
                                    Text("$" + String(format: "%.1f", activity.price))
                                }
                                VStack(alignment: .leading, spacing: 5) {
                                    ForEach(0..<activity.startTimes.count, id: \.self) { index in
                                        HStack {
                                            Image(systemName: "clock")
                                            Text(activity.startTimes[index])
                                        }
                                    }
                                }
                            }
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(12)
                        .background(.white)
                        .cornerRadius(20)
                        .padding()
                        .shadow(color: Color.black.opacity(0.25), radius: 10)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .background(Color("Background"))
        .navigationBarHidden(true)
    }
}

extension DestinationView {
    private var header: some View {
        ZStack(alignment: .bottom) {
            Image(destination.imageUrl)
                .resizable()
                .frame(width: .infinity, height: 400)
                .overlay(
                    LinearGradient(colors: [.black.opacity(0.3), .black.opacity(0.1), .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                    .padding()
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(destination.city)
                        .font(.system(size: 40, weight: .bold))
                    
                    HStack {
                        Image(systemName: "location.fill")
                        Text(destination.country)
                    }
                    .font(.title2)
                }
                .padding()
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 400)
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationView(destination: DataService.destinations.first!)
        }
    }
}
