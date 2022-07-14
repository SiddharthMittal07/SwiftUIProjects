//
//  ResultsViewModel.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import Foundation

class ResultsViewModel: ObservableObject {
    
    @Published private(set) var results: [Result]? {
        didSet {
            prepareChartData()
        }
    }
    @Published private(set) var resultsDef = "We have used 6 Supervised Machine Learning Algorithms, namely: Support Vector Machine, Decision Tree Classification, Logistic Regression, Naive Bayes Classification, Random Forest Algorithm, and K-Nearest Neighbors. The results are observed on the basis of 4 metrics of Precision, Recall, Accuracy and Processing Time."
    @Published private(set) var factors = [
        Factor(factor: "Accuracy", definition: "Accuracy is defined as the percentage of correct predictions for the test data. It can be calculated easily by dividing the number of correct predictions by the number of total predictions."),
        Factor(factor: "Precision", definition: "Precision is one indicator of a machine learning model's performance – the quality of a positive prediction made by the model. Precision refers to the number of true positives divided by the total number of positive predictions."),
        Factor(factor: "Time", definition: "Time complexity can be seen as the measure of how fast or slow an algorithm will perform for the input size. Time complexity is always given with respect to some input size (say n)."),
        Factor(factor: "Recall", definition: "Recall literally is how many of the true positives were recalled (found), i.e. how many of the correct hits were also found.")
    ]
    @Published private(set) var factorIndex = 0
    @Published private(set) var chartData: [(String, Double)]?
    
    init() {
        fetchResults()
    }
    
    func fetchResults() {
        let urlString = "https://gist.githubusercontent.com/SiddharthMittal07/3c7afd2a88faa690291f9474b60483b6/raw/f2977fdbd8bf4fbd78878e773582ef75f75340ac/major_project_algorithms.json"
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
                let fetchedResults = try JSONDecoder().decode([Result].self, from: data)
                DispatchQueue.main.async {
                    self?.results = fetchedResults
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    
    func setFactorIndex(to index: Int) {
        self.factorIndex = index
        self.prepareChartData()
    }
    
    func prepareChartData() {
        self.chartData = nil
        if let results = self.results {
            self.chartData = results.map({ result in
                if self.factorIndex == 0 {
                    return (result.algorithm, result.accuracy)
                } else if self.factorIndex == 1 {
                    return (result.algorithm, result.precision)
                } else if self.factorIndex == 2 {
                    return (result.algorithm, result.time)
                } else {
                    return (result.algorithm, result.recall)
                }
            })
        }
    }
    
}
