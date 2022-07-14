//
//  ComicsView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicsView: View {
    
    @StateObject private var vm = ComicsViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if vm.coms.count == 0 {
                ProgressView()
                    .padding(.top, 50)
            } else {
                comicsGrid
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.07).ignoresSafeArea())
    }
}


extension ComicsView {
    private var comicsGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 130))], spacing: 20) {
            ForEach(vm.coms) { comic in
                NavigationLink {
                    ComicDetailView(comic: comic)
                        .environmentObject(vm)
                } label: {
                    ComicPreview(comic: comic)
                }
                .padding(3)
            }
        }
    }
}

struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ComicsView()
                .navigationTitle("Marvel Comics")
        }
    }
}
