//
//  AlgorithmDetailView.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import SwiftUI

struct AlgorithmDetailView: View {
    
    let algorithm: Algorithm
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 25) {
                HStack(alignment: .center) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Text(algorithm.algorithm)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding(.horizontal)
                
                Text(algorithm.information.main)
                    .padding()
                    .font(.subheadline)
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                titleAndPoints(title: "Applications", points: algorithm.information.applications)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            TableColumn(" ")
                            TableColumn("Present")
                            TableColumn("Absent")
                        }
                        HStack(spacing: 0) {
                            TableColumn("Present")
                            TableColumn("\(algorithm.matrix[0][0])")
                            TableColumn("\(algorithm.matrix[0][1])")
                        }
                        HStack(spacing: 0) {
                            TableColumn("Absent")
                            TableColumn("\(algorithm.matrix[1][0])")
                            TableColumn("\(algorithm.matrix[1][1])")
                        }
                    }
                }
                .padding()
                
                HStack(alignment: .top, spacing: 25) {
                    titleAndPoints(title: "Pros", points: algorithm.information.pros)
                        .font(.subheadline)
                    titleAndPoints(title: "Cons", points: algorithm.information.cons)
                        .font(.subheadline)
                }
                .padding()
                
                Rectangle()
                    .fill(.clear)
                    .frame(height: 50)
            }
        }
        .navigationBarHidden(true)
        .background(Color("background").ignoresSafeArea())
    }
}


extension AlgorithmDetailView {
    func titleAndPoints(title: String, points: [String]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
            VStack(alignment: .leading, spacing: 5) {
                ForEach(points, id: \.self) { app in
                    Text("• \(app)")
                }
            }
        }
    }
}


struct AlgorithmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlgorithmDetailView(algorithm: dev.devAlgorithm)
    }
}
