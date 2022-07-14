//
//  ComicDetailView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 07/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicDetailView: View {
    
    let comic: Comic
    @EnvironmentObject var vm: ComicsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    headerImage
                    headerInfo
                    if let description = comic.description {
                        Text(description)
                            .padding()
                            .background(.white)
                            .padding(.horizontal)
                    }
                    charactersCarousel
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    creatorsCarousel
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
            }
            .onAppear {
                vm.fetchCharacters(of: comic)
                vm.fetchCreators(of: comic)
            }
            .onDisappear {
                vm.destroyFetchedCharacters()
                vm.destroyFetchedCreators()
            }
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .padding()
            }
        }
        .background(Color.black.opacity(0.1).ignoresSafeArea())
        .navigationBarHidden(true)
    }
}


extension ComicDetailView {
    private var creatorsCarousel: some View {
        VStack(alignment: .leading) {
            Text("Creators".uppercased())
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            if let creators = vm.creatorsOfComic {
                if creators.count == 0 {
                    Text("No Creators Found!")
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(creators.indices, id: \.self) { index in
                                if (index == 0) {
                                    PersonPreview(thumbnail: creators[index].thumbnail, name: creators[index].fullName)
                                        .padding(.leading)
                                } else if index == creators.count - 1 {
                                    PersonPreview(thumbnail: creators[index].thumbnail, name: creators[index].fullName)
                                        .padding(.trailing)
                                } else {
                                    PersonPreview(thumbnail: creators[index].thumbnail, name: creators[index].fullName)
                                }
                            }
                        }
                    }
                }
            } else {
                ProgressView()
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    private var charactersCarousel: some View {
        VStack(alignment: .leading) {
            Text("Characters".uppercased())
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            if let characters = vm.charactersOfComic {
                if characters.count == 0 {
                    Text("No Characters Found!")
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(characters.indices, id: \.self) { index in
                                if index == 0 {
                                    PersonPreview(thumbnail: characters[index].thumbnail, name: characters[index].name)
                                        .padding(.leading)
                                } else if index == characters.count - 1 {
                                    PersonPreview(thumbnail: characters[index].thumbnail, name: characters[index].name)
                                        .padding(.trailing)
                                } else {
                                    PersonPreview(thumbnail: characters[index].thumbnail, name: characters[index].name)
                                }
                            }
                        }
                    }
                }
            } else {
                ProgressView()
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    private var headerImage: some View {
        WebImage(url: URL(string: extractImageURL(path: comic.thumbnail.path, ext: comic.thumbnail.ext)))
            .resizable()
            .frame(width: 180, height: 250)
            .cornerRadius(15)
            .overlay(LinearGradient(colors: [.black.opacity(0.2), .black.opacity(0.3)], startPoint: .top, endPoint: .bottom).cornerRadius(15))
            .padding(.vertical)
    }
    
    private var headerInfo: some View {
        VStack(spacing: 7) {
            Text(comic.modifiedTitle)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Issue Number: #\(comic.issueNumber)")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text(comic.year)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .multilineTextAlignment(.center)
    }
}


struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ComicDetailView(comic: dev.testComic)
                .environmentObject(ComicsViewModel())
        }
    }
}
