//
//  HomeView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection: Int = 1
    private let tabItemLabels = ["Comics", "Characters", "Events", "Stories"]
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ComicsView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Comics")
                }
                .tag(1)
            
            CharactersView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Characters")
                }
                .tag(2)
            
            EventsView()
                .tabItem {
                    Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    Text("Events")
                }
                .tag(3)
            
            SeriesView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Stories")
                }
                .tag(4)
        }
        .navigationTitle("Marvel " + tabItemLabels[selection-1])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
