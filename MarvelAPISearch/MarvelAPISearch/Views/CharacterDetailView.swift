//
//  CharacterDetailView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 06/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetailView: View {
    
    @EnvironmentObject var vm: CharactersViewModel
    let character: Character
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                header
                if character.description.count > 0 {
                    description
                }
                comicsCarousel
                    .padding(.vertical)
                eventsCarousel
                    .padding(.vertical)
                seriesCarousel
                    .padding(.vertical)
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 100)
            }
        }
        .onAppear {
            vm.fetchComicsForCharacter(id: character.id)
            vm.fetchEvents(for: character)
            vm.fetchSeries(of: character)
        }
        .onDisappear {
            vm.destroyComics()
            vm.destroyFetchedEvents()
            vm.destroySeries()
        }
        .navigationBarHidden(true)
        .background(Color.black.opacity(0.15).ignoresSafeArea())
        .ignoresSafeArea()
    }
}


extension CharacterDetailView {
    private var headerImage: some View {
        WebImage(url: URL(string: extractImageURL(path: character.thumbnail.path, ext: character.thumbnail.ext)))
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
            .cornerRadius(20)
            .overlay(LinearGradient(colors: [Color.black.opacity(0.5),Color.black.opacity(0.3),Color.black.opacity(0.5)], startPoint: .top, endPoint: .bottom).cornerRadius(20))
    }
    
    private var header: some View {
        ZStack {
            headerImage
            
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                    }
                    Spacer()
                    Button { } label: {
                        Text("•••")
                            .font(.title)
                            .rotationEffect(Angle(degrees: 90))
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var description: some View {
        Text(character.description)
            .padding()
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal)
    }
    
    private var comicsCarousel: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Comics".uppercased())
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            if let comics = vm.characterComics {
                if comics.count > 0 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 30) {
                            ForEach(0..<comics.count, id: \.self) { index in
                                if index == 0 {
                                    ComicPreview(comic: comics[index])
                                        .frame(width: 150, height: 250)
                                        .padding(.leading)
                                } else {
                                    ComicPreview(comic: comics[index])
                                        .frame(width: 150, height: 250)
                                }
                            }
                        }
                    }
                } else {
                    Text("NO COMICS AVAILABLE")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            }
        }
    }
    
    private var eventsCarousel: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("EVENTS")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            if let events = vm.characterEvents {
                if events.count > 0 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 10) {
                            ForEach(events.indices, id: \.self) { index in
                                if index == 0 {
                                    localEventPreview(for: events[index])
                                        .padding(.leading)
                                } else if index == events.count - 1 {
                                    localEventPreview(for: events[index])
                                        .padding(.trailing)
                                } else {
                                    localEventPreview(for: events[index])
                                }
                            }
                        }
                    }
                } else {
                    Text("No Events Found")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
            } else {
                ProgressView()
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    private var seriesCarousel: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("SERIES")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            if let series = vm.characterSeries {
                if series.count > 0 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(series.indices, id: \.self) { index in
                                if index == 0 {
                                    localSeriePreview(for: series[index])
                                        .padding(.leading)
                                } else if index == series.count - 1 {
                                    localSeriePreview(for: series[index])
                                        .padding(.trailing)
                                } else {
                                    localSeriePreview(for: series[index])
                                }
                            }
                        }
                    }
                } else {
                    Text("No Series Found")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
            } else {
                ProgressView()
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    func localEventPreview(for event: Event) -> some View {
        VStack {
            WebImage(url: URL(string: extractImageURL(path: event.thumbnail.path, ext: event.thumbnail.ext)))
                .resizable()
                .frame(width: 150, height: 180)
                .cornerRadius(20)
            
            Text(event.title)
                .font(.headline)
            
            if let start = event.start, let end = event.end {
                let startYear = start.components(separatedBy: "-")[0]
                let endYear = end.components(separatedBy: "-")[0]
                Text(startYear == endYear ? endYear : "\(startYear)-\(endYear)")
                    .font(.headline)
            }
        }
        .padding(9)
        .background(.thinMaterial)
        .cornerRadius(20)
        .frame(width: 180)
    }
    
    func localSeriePreview(for serie: Serie) -> some View {
        ZStack {
            WebImage(url: URL(string: extractImageURL(path: serie.thumbnail.path, ext: serie.thumbnail.ext)))
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .overlay(Color.black.opacity(0.5))
                .cornerRadius(20)
            
            VStack {
                if let rating = serie.rating {
                    HStack {
                        Spacer()
                        Text(rating)
                            .font(.headline)
                    }
                }
                Spacer()
                Text(serie.title)
                    .font(.headline)
                if let description = serie.description {
                    Text(description)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .frame(width: 280)
    }
}


struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetailView(character: dev.testCharacter)
                .environmentObject(CharactersViewModel())
        }
    }
}


