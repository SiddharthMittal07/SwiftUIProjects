//
//  SeriesView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 08/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SeriesView: View {
    
    @StateObject private var vm = SeriesViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 4) {
                if let series = vm.filteredSeries {
                    if series.count == 0 {
                        Text("No Series Fetched")
                            .padding(.top, 40)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        ForEach(series) { serie in
                            SeriePreview(serie: serie)
                        }
                    }
                } else {
                    ProgressView()
                        .padding(.top, 40)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SeriesView()
                .navigationTitle("Marvel Series")
        }
    }
}
