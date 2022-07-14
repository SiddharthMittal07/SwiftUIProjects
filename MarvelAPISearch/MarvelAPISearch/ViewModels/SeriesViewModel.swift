//
//  SeriesViewModel.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 08/07/22.
//

import Foundation
import CryptoKit

class SeriesViewModel: ObservableObject {
    
    private var series: [Serie]? {
        didSet {
            if let series = self.series {
                filteredSeries = series.sorted(by: { serie1, serie2 in
                    if serie1.thumbnail.path.hasSuffix("image_not_available") {
                        return false
                    } else if serie2.thumbnail.path.hasSuffix("image_not_available") {
                        return true
                    } else {
                        return true
                    }
                })
            } else {
                filteredSeries = nil
            }
        }
    }
    @Published private(set) var filteredSeries: [Serie]?
    
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
        fetchSeries()
    }
    
    func fetchSeries() {
        let urlString = "https://gateway.marvel.com:443/v1/public/series?limit=100&ts=\(self.ts)&apikey=\(publicKey)&hash=\(self.hash)"
        
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
                let fetchedSeries = try JSONDecoder().decode(Series.self, from: data)
                DispatchQueue.main.async {
                    self?.series = fetchedSeries.data.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
}
