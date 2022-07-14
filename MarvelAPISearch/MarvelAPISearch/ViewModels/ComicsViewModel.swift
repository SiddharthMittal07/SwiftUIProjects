//
//  ComicsViewModel.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 06/07/22.
//

import Foundation
import CryptoKit
import SwiftUI

class ComicsViewModel: ObservableObject {
    
    @Published private(set) var coms: [Comic] = []
    @Published private(set) var charactersOfComic: [Character]?
    @Published private(set) var creatorsOfComic: [Creator]?
    private var comics: [Comic] = [] {
        didSet {
            coms = comics.sorted(by: {
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
    
    
    let ts: String = String(Date().timeIntervalSince1970)
    var hash: String = ""
    
    private func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
    
    init() {
        hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        fetchComics()
    }
    
    func fetchComics() {
        let fetchComicsUrl = "https://gateway.marvel.com:443/v1/public/comics?format=comic&limit=100&formatType=comic&ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
    
        print(ts)
        print(hash)
        print(fetchComicsUrl)
        
        guard let url = URL(string: fetchComicsUrl) else { return }
        
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
                let fetchedComics = try JSONDecoder().decode(Comics.self, from: data)
                
                DispatchQueue.main.async {
                    self?.comics = fetchedComics.data.results
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
        .resume()
    }
    
    
    func fetchCharacters(of comic: Comic) {
        let urlString = "https://gateway.marvel.com:443/v1/public/comics/\(comic.id)/characters?ts=\(self.ts)&apikey=\(publicKey)&hash=\(hash)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data else {
                print("No data fetched")
                return
            }
            
            guard error == nil else {
                print("ERROR: \(error?.localizedDescription ?? "reer")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error in reponse")
                return
            }
            
            do {
                let fetchedCharacters = try JSONDecoder().decode(Characters.self, from: data)
                
                DispatchQueue.main.async {
                    self?.charactersOfComic = fetchedCharacters.data.results
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            
        }
        .resume()
    }
    
    func fetchCreators(of comic: Comic) {
        let urlString = "https://gateway.marvel.com:443/v1/public/comics/\(comic.id)/creators?limit=100&ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                print("No data fetched")
                return
            }
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "reer")")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error no response")
                return
            }
            
            do {
                let fetchedCreators = try JSONDecoder().decode(Creators.self, from: data)
                
                DispatchQueue.main.async {
                    self?.creatorsOfComic = fetchedCreators.data.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func destroyFetchedCreators() {
        self.creatorsOfComic = nil
    }
    
    func destroyFetchedCharacters() {
        self.charactersOfComic = nil
    }
}
