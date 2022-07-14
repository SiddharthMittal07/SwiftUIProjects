//
//  CancerInfoView.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import SwiftUI
import SwiftUICharts

struct CancerInfoView: View {
    
    @EnvironmentObject private var vm: AlgorithmsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("LITTLE BIT ABOUT BRAIN CANCER")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding(.horizontal)
                
                Text(vm.cancerDef)
                    .font(.subheadline)
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.horizontal)
                
                VStack(spacing: 15) {
                    Text("BRAIN CANCER DEATHS")
                        .font(.headline)
                    
                    if let data = vm.lineChartData {
                        LineChartView(data: data,
                                      title: "1990-2019",
                                      form: ChartForm.extraLarge
                        )
                    }
                    
                    Text("The line chart displays the increase of brain cancer deaths in India for the timeline 1990-2019")
                        .multilineTextAlignment(.center)
                        .font(.caption)
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

struct CancerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CancerInfoView()
            .environmentObject(AlgorithmsViewModel())
    }
}
