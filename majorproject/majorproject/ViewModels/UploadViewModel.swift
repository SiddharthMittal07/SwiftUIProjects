//
//  UploadViewModel.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import Foundation
import SwiftUI

class UploadViewModel: ObservableObject {
    
    @Published private(set) var uploadDef = "Test our Supervised Machine Learning Algorithms by uploading an MRI Image of a brain and check the results. The server returns the results of all 6 algorithms and they are displayed as a Donut Chart. The final prediction depends on the result of all algorithms."
    @Published private(set) var returnedResult: [APIResult]?
    @Published var image: UIImage?
    @Published var showImagePicker = false
    
    init() {
        self.image = UIImage(named: "brain")
    }
    
    func uploadImage() {
        let imageData: Data = self.image?.jpegData(compressionQuality: 0.1) ?? Data()
        let imgStr: String = imageData.base64EncodedString()
        
        let paramStr: String = "upImage=\(imgStr)"
        let paramData = paramStr.data(using: .utf8) ?? Data()
        
        guard let url = URL(string: "https://mlalgorithmsapi.herokuapp.com/prediction") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = paramData
        
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            print("Inside")
            guard let data = data else {
                print("Error in data")
                return
            }
            guard error == nil else {
                print("Error")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error in response")
                return
            }
            
            do {
                let fetchedResults = try JSONDecoder().decode([APIResult].self, from: data)
                DispatchQueue.main.async {
                    self?.returnedResult = fetchedResults
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
        
    }
}
