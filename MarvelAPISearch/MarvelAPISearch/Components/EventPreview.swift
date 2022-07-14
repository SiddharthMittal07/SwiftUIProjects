//
//  EventPreview.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 08/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventPreview: View {
    
    let event: Event
    let index: Int
    
    var body: some View {
        if index%2 == 0 {
            HStack(alignment: .top, spacing: 7) {
                WebImage(url: URL(string: extractImageURL(path: event.thumbnail.path, ext: event.thumbnail.ext)))
                    .resizable()
                    .frame(width: 150, height: 160)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 7) {
                    Text(event.title)
                        .font(.headline)
                    Text(event.description)
                        .lineLimit(3)
                        .font(.subheadline)
                        .padding(.trailing)
                        .multilineTextAlignment(.leading)
                    
                    if let start = event.start, let end = event.end {
                        Text("\(start.components(separatedBy: "-")[0])-\(end.components(separatedBy: "-")[0])")
                            .font(.subheadline)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.black)
            .padding(7)
            .background(.white)
            .cornerRadius(20)
        } else {
            HStack(alignment: .top, spacing: 7) {
                VStack(alignment: .trailing, spacing: 7) {
                    Text(event.title)
                        .font(.headline)
                    Text(event.description)
                        .lineLimit(3)
                        .font(.subheadline)
                        .padding(.leading)
                        .multilineTextAlignment(.trailing)
                    if let start = event.start, let end = event.end {
                        Text("\(start.components(separatedBy: "-")[0])-\(end.components(separatedBy: "-")[0])")
                            .font(.subheadline)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                WebImage(url: URL(string: extractImageURL(path: event.thumbnail.path, ext: event.thumbnail.ext)))
                    .resizable()
                    .frame(width: 150, height: 160)
                    .cornerRadius(20)
            }
            .foregroundColor(.black)
            .padding(7)
            .background(.white)
            .cornerRadius(20)
        }
    }
}

struct EventPreview_Previews: PreviewProvider {
    static var previews: some View {
        EventPreview(event: dev.testEvent, index: 1)
    }
}
