//
//  ResultsView.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import SwiftUI
import SwiftUICharts

struct ResultsView: View {
    
    @StateObject private var vm = ResultsViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 25) {
                Text("RESULTS")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(vm.resultsDef)
                    .font(.subheadline)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                factors
                
                if let chartData = vm.chartData {
                    BarChartView(data: ChartData(values: chartData),
                                 title: vm.factors[vm.factorIndex].factor,
                                 form: ChartForm.extraLarge,
                                 dropShadow: false,
                                 cornerImage: Image(systemName: "chart.bar"),
                                 valueSpecifier: "%.2f",
                                 animatedToBack: true
                    )
                } else {
                    ProgressView()
                        .padding(.top, 40)
                }
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        TableColumn("Algorithm")
                        TableColumn("Accuracy")
                        TableColumn("Precision")
                        TableColumn("Time")
                    }
                    if let results = vm.results {
                        ForEach(results) { result in
                            HStack(spacing: 0) {
                                TableColumn(result.algorithm)
                                TableColumn(extract2DigitNumber(result.accuracy))
                                TableColumn(extract2DigitNumber(result.precision))
                                TableColumn("\(extract2DigitNumber(result.time))s")
                            }
                        }
                    }
                }
                
                Rectangle().fill(.clear)
                    .frame(height: 150)
            }
        }
        .background(Color("background").ignoresSafeArea())
    }
    
    func extract2DigitNumber(_ num: Double) -> String {
        return String(format: "%.2f", num)
    }
}

struct TableColumn: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Rectangle()
            .fill(.white)
            .foregroundColor(.primary)
            .border(.blue, width: 1)
            .overlay(alignment: .center) {
                Text(text)
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.caption)
            }
            .frame(width: UIScreen.main.bounds.width * 0.23, height: 60)
    }
}

extension ResultsView {
    private var factors: some View {
        VStack(spacing: 15) {
            HStack {
                ForEach(vm.factors.indices, id: \.self) { index in
                    Button {
                        vm.setFactorIndex(to: index)
                    } label: {
                        Text(vm.factors[index].factor)
                            .font(.subheadline)
                            .fontWeight(index == vm.factorIndex ? .bold : .regular)
                            .padding()
                            .foregroundColor(index == vm.factorIndex ? .white : .black)
                    }
                    .background(Capsule().fill(index == vm.factorIndex ? .blue :.white))
                }
            }
            
            Text(vm.factors[vm.factorIndex].definition)
                .font(.subheadline)
                .padding()
                .background(.white)
                .cornerRadius(15)
                .padding(.horizontal)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
