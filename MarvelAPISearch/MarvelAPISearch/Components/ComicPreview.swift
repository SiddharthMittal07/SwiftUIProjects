//
//  ComicPreview.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicPreview: View {

    let comic: Comic

    var body: some View {
        ZStack {
            WebImage(url: URL(string: extractImageURL(path: comic.thumbnail.path, ext: comic.thumbnail.ext)))
                .resizable()
                .aspectRatio(2/3, contentMode: .fill)
                .overlay(Color.black.opacity(0.5))
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Spacer()
                    Text("#\(comic.issueNumber)")
                        .font(.headline)
                }
                
                Spacer()
                
                Text(comic.modifiedTitle)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(4)
                Text(comic.year)
                    .font(.body)
                
            }
            .foregroundColor(.white)
            .padding(8)
        }
        .cornerRadius(10)
    }
}

struct ComicPreview_Previews: PreviewProvider {
    static var previews: some View {
        ComicPreview(comic: dev.testComic)
            .frame(width: 120, height: 300)
    }
}
