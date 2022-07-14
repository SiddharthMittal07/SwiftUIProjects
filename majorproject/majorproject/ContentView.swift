//
//  ContentView.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showHomeView: Bool = true
    @State private var showUploadView: Bool = false
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            if showHomeView {
                HomeView(showUploadView: $showUploadView)
            } else {
                ResultsView()
            }
            
            tabBar
                .ignoresSafeArea()
        }
        .sheet(isPresented: $showUploadView) {
            UploadView()
        }
    }
}


extension ContentView {
    private var tabBar: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Button {
                        showHomeView = true
                    } label: {
                        Image(systemName: "house.fill")
                            .padding(20)
                            .foregroundColor(showHomeView ? .black : .black.opacity(0.2))
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button {
                        showHomeView = false
                    } label: {
                        Image(systemName: "chart.xyaxis.line")
                            .padding(20)
                            .foregroundColor(!showHomeView ? .black : .black.opacity(0.2))
                    }
                    .padding(.horizontal)
                }
                .font(.title)
                .background(.white)
                .cornerRadius(20)
                .padding(.top, 40)
                .background(Color("background"))
                
                Button {
                    showUploadView = true
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .foregroundColor(.white)
                }
                .font(.title)
                .background(Circle().fill(.orange))
                .padding()
                .background(Circle().fill(Color("background")))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
