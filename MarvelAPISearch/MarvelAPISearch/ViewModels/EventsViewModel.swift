//
//  EventsViewModel.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 07/07/22.
//

import Foundation
import CryptoKit

class EventsViewModel: ObservableObject {
    
    @Published private(set) var events: [Event] = []
    
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
        fetchEvents()
    }

    
    func fetchEvents() {
        let urlString = "https://gateway.marvel.com:443/v1/public/events?limit=100&ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
        
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
                print("error in response")
                return
            }
            
            do {
                let fetchedEvents = try JSONDecoder().decode(Events.self, from: data)
                DispatchQueue.main.async {
                    self?.events = fetchedEvents.data.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
}
