//
//  CharactersViewModel.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import Foundation
import CryptoKit

class CharactersViewModel: ObservableObject {
    
    @Published private(set) var characters: [Character]? = [] {
        didSet {
            if let characters = characters {
                if characters.count > 0 {
                    chars = characters.sorted(by: {
                        if ($0.imageFound) {
                            return true
                        } else if ($1.imageFound) {
                            return false
                        } else {
                            return true
                        }
                    })
                }
            }
        }
    }
    @Published var searchQuery: String = ""
    @Published private(set) var chars: [Character] = []
    @Published private(set) var characterComics: [Comic]?
    @Published private(set) var characterEvents: [Event]?
    @Published private(set) var characterSeries: [Serie]?
    
    let ts: String = String(Date().timeIntervalSince1970)
    var hash: String = ""
    
    init() {
        hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
    }
    
    private func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
    
    func fetchCharacters() {
        let fetchCharactersUrl = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(self.searchQuery)&ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
        
        guard let url = URL(string: fetchCharactersUrl) else { return }
        
        self.characters = nil
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data else {
                print("Error in data")
                return
            }
            
            guard error == nil else {
                print("ERROR")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("error in response")
                return
            }
            
            do {
                let fetchedCharacters = try JSONDecoder().decode(Characters.self, from: data)
                
                DispatchQueue.main.async {
                    self?.characters = fetchedCharacters.data.results
                }
                
            } catch {
                print(error.localizedDescription)
                print("HELLO")
            }
        }
        .resume()
    }
    
    
    func fetchComicsForCharacter(id: Int) {
        let fetchComicsForCharacterUrl = "https://gateway.marvel.com:443/v1/public/characters/\(id)/comics?limit=50&ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
        
        guard let url = URL(string: fetchComicsForCharacterUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data else {
                print("No data fetched")
                return
            }
            
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? " ")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error in response...")
                return
            }
            
            do {
                let fetchedComics = try JSONDecoder().decode(Comics.self, from: data)
                
                DispatchQueue.main.async {
                    self?.characterComics = fetchedComics.data.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func destroyComics() {
        self.characterComics = nil
    }
    
    func fetchEvents(for character: Character) {
        let urlString = "https://gateway.marvel.com:443/v1/public/characters/\(character.id)/events?limit=100&ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { print("No data fetched"); return }
            guard error == nil else { print("ERROR: \(error?.localizedDescription ?? "reer")"); return }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error in response")
                return
            }
            
            do {
                let fetchedEvents = try JSONDecoder().decode(Events.self, from: data)
                DispatchQueue.main.async {
                    self?.characterEvents = fetchedEvents.data.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func destroyFetchedEvents() {
        self.characterEvents = nil
    }
    
    func fetchSeries(of character: Character) {
        let urlString = "https://gateway.marvel.com:443/v1/public/characters/\(character.id)/series?ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                print("No Data Fetched")
                return
            }
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "reer")")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error in response")
                return
            }
            
            do {
                let fetchedSeries = try JSONDecoder().decode(Series.self, from: data)
                DispatchQueue.main.async {
                    self?.characterSeries = fetchedSeries.data.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func destroySeries() {
        self.characterSeries = nil
    }
}
