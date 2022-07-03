//
//  HomeView.swift
//  FlutterTravelDemo
//
//  Created by Siddharth Mittal on 01/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: TravelViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                header
                    .padding()
                filterButtons
                destinationCarousel
                    .padding(.vertical)
                hotelCarousel
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("All Activities")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .center, spacing: 25) {
                        ForEach(vm.activities) { activity in
                            ActivityPreview(activity: activity)
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color("Background"))
        .navigationBarHidden(true)
    }
}


extension HomeView {
    private var header: some View {
        Text("What would you like to find?")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
    }
    
    
    private var filterButtons: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(vm.travelTypes, id: \.content) { item in
                TravelTypeButton(travelTypeButton: item)
                    .onTapGesture {
                        vm.chooseTravelFilter(travelTypeButton: item)
                    }
            }
            .frame(height: 60)
        }
    }
    
    
    private var destinationCarousel: some View {
        VStack(spacing: 4) {
            carouselHeader(headerTitle: "Top Destinations")
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.destinations) { destination in
                        NavigationLink {
                            DestinationView(destination: destination)
                        } label: {
                            DestinationPreview(destination: destination)
                                .padding(.horizontal, 7)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(.vertical)
                .frame(height: 300)
            }
        }
    }
    
    
    private var hotelCarousel: some View {
        VStack(spacing: 4) {
            carouselHeader(headerTitle: "Top Hotels")
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.hotels) { hotel in
                        HotelPreview(hotel: hotel)
                            .padding(.horizontal, 7)
                    }
                }
                .padding(.vertical)
                .frame(height: 300)
            }
        }
    }
    
    
    private func carouselHeader(headerTitle: String) -> some View {
        HStack {
            Text(headerTitle)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Button {
                
            } label: {
                Text("See All")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(TravelViewModel())
        }
    }
}
