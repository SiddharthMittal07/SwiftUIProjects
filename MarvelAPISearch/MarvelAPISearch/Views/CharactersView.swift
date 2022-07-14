//
//  CharactersView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject var vm = CharactersViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                searchFunctionality
                    .padding(.horizontal)
                if vm.characters == nil {
                    ProgressView()
                        .padding(.top, 40)
                } else {
                    characterStack
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea())
    }
}


extension CharactersView {
    private var searchFunctionality: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                
                TextField("Enter marvel character...", text: $vm.searchQuery)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(.white)
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .background(.white)
            .cornerRadius(20)
            .padding(.vertical)
        
            Button {
                vm.fetchCharacters()
            } label: {
                Text("Fetch Results".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
    
    private var characterStack: some View {
        LazyVStack {
            ForEach(vm.chars) { character in
                NavigationLink {
                    CharacterDetailView(character: character)
                        .environmentObject(vm)
                } label: {
                    CharacterPreview(character: character)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharactersView()
        }
    }
}
