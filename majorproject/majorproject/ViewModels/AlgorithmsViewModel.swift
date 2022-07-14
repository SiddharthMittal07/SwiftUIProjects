//
//  AlgorithmsViewModel.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import Foundation

class AlgorithmsViewModel: ObservableObject {
    
    @Published private(set) var algorithms: [Algorithm]?
    @Published private(set) var cancerDef = "Brain tumors refer to the unusual and uncontrollable cell growth in the brain which causes more pressure inside the restricted space in the skull. Since the brain is confined in the bony skull, it cannot inflate to make space for the uncontrollable growth which results in the squashing of normal brain tissues. This unorthodox growth causes life-threatening complications by damaging the brain."
    @Published private(set) var motivation = "Cancer is the second-leading cause of death in the world. India is reporting over 13 lakh deaths every year due to cancer. This project will help in providing cancer detection related medical help in remote areas or areas where such facilities aren’t available. This will also save a lot of time as well as reduces the probability of human error."
    @Published private(set) var brainCancerData: [Cancer]? {
        didSet {
            prepareLineChartData()
        }
    }
    @Published private(set) var lineChartData: [Double]?
    
    init() {
        fetchAlgorithms()
        fetchBrainCancerData()
    }
    
    func fetchAlgorithms() {
        let urlString = "https://gist.githubusercontent.com/SiddharthMittal07/554b26ec04129f393e2fc59c82c0f1d3/raw/871224e25d4eb30b19eb7c2a945f7db0af405787/major_project_define.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
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
                let fetchedAlgorithms = try JSONDecoder().decode([Algorithm].self, from: data)
                DispatchQueue.main.async {
                    self?.algorithms = fetchedAlgorithms
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    
    func fetchBrainCancerData() {
        let urlString = "https://gist.githubusercontent.com/SiddharthMittal07/a43f70a41e6ad3e2103e419aafca06e3/raw/0517f5b6bcf4a4db6e55cd6fbc007ae94418db8e/BrainCancerNoIndia.json"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
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
                let fetchedData = try JSONDecoder().decode([Cancer].self, from: data)
                DispatchQueue.main.async {
                    self?.brainCancerData = fetchedData
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func prepareLineChartData() {
        if let data = self.brainCancerData {
            self.lineChartData = data.map { $0.brainCancer }
        }
    }
}
