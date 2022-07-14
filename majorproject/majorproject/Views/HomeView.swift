//
//  HomeView.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import SwiftUI

struct HomeView: View {
    @Binding var showUploadView: Bool
    @StateObject private var vm = AlgorithmsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    header
                    cancerInfo
                    algorithms
                        .padding(.vertical)
                    motivationAndLinks
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 100)
                }
            }
            .navigationBarHidden(true)
            .background(Color("background").ignoresSafeArea())
        }
    }
}


extension HomeView {
    private var header: some View {
        VStack(spacing: 5) {
            Text("Predictive Analysis for Brain Cancer Detection using Machine Learning Techniques")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Button {
                showUploadView = true
            } label: {
                Text("Upload MRI")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .background(.green)
            .cornerRadius(20)
            .padding()
        }
        .padding(.horizontal)
    }
    
    private var cancerInfo: some View {
        NavigationLink {
            CancerInfoView()
                .environmentObject(vm)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("What is Brain Cancer?")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .font(.headline)
                
                Text(vm.cancerDef.components(separatedBy: ".")[0] + ".")
                    .multilineTextAlignment(.leading)
                    .font(.subheadline)
                
                Text("Learn more..")
                    .foregroundColor(.blue)
                    .font(.subheadline)
            }
            .foregroundColor(.primary)
            .padding()
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal)
        }
    }
    
    private var algorithms: some View {
        VStack(spacing: 10) {
            Text("Algorithms".uppercased())
                .font(.headline)
            if let algorithms = vm.algorithms {
                TabView {
                    ForEach(algorithms.indices, id: \.self) { index in
                        NavigationLink {
                            AlgorithmDetailView(algorithm: algorithms[index])
                        } label: {
                            VStack(spacing: 8) {
                                Text(algorithms[index].algorithm)
                                    .font(.headline)
                                
                                Text(algorithms[index].information.main)
                                    
                                HStack(spacing: 5) {
                                    Spacer()
                                    Text("Learn more")
                                    Image(systemName: "arrow.right")
                                }
                                .foregroundColor(.blue)
                            }
                            .font(.subheadline)
                            .padding()
                            .background(.white)
                            .cornerRadius(15)
                            .foregroundColor(.primary)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 180)
                .tabViewStyle(.page(indexDisplayMode: .never))
            } else {
                ProgressView()
                    .padding(.top, 40)
            }
        }
    }
    
    private var motivationAndLinks: some View {
        VStack(spacing: 10) {
            Text("Motivation")
                .underline()
                .font(.headline)
            Text(vm.motivation)
                .multilineTextAlignment(.center)
                .font(.subheadline)
            HStack {
                VStack {
                    Image("api")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Text("API")
                }
                Spacer()
                VStack {
                    Image("github")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Text("Data")
                }
                Spacer()
                VStack {
                    Image("linkedin")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Text("Social")
                }
            }
            .font(.subheadline)
            .padding()
        }
        .foregroundColor(.primary)
        .padding(.horizontal)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showUploadView: .constant(false))
    }
}
