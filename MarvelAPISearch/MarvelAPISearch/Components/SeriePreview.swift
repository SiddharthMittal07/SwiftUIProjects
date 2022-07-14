//
//  SeriePreview.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 08/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SeriePreview: View {
    
    let serie: Serie
    
    var body: some View {
        ZStack {
            headerImage
            headerInfo
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
        }
        .padding()
    }
}


extension SeriePreview {
    private var headerImage: some View {
        WebImage(url: URL(string: extractImageURL(path: serie.thumbnail.path, ext: serie.thumbnail.ext)))
            .resizable()
            .frame(height: 220)
            .cornerRadius(20)
            .overlay(Color.black.opacity(0.5).cornerRadius(20))
    }
    
    private var headerInfo: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let rating = serie.rating, rating.count > 0 {
                HStack {
                    Spacer()
                    Text(rating)
                        .font(.headline)
                        .padding()
                        .background(Capsule().fill(.white))
                        .foregroundColor(.black)
                }
            }
            Spacer()
            Text(serie.title.components(separatedBy: "(")[0])
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(serie.title.components(separatedBy: "(")[1].components(separatedBy: ")")[0])
                .fontWeight(.semibold)
        }
    }
}
struct SeriePreview_Previews: PreviewProvider {
    static var previews: some View {
        SeriePreview(serie: dev.testSerie)
    }
}
