//
//  PersonPreview.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 07/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PersonPreview: View {
    
    let thumbnail: Thumbnail
    let name: String
    
    var body: some View {
        VStack {
            if !thumbnail.path.hasSuffix("image_not_available") {
                WebImage(url: URL(string: extractImageURL(path: thumbnail.path, ext: thumbnail.ext)))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFit()
                    .padding()
                    .padding()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .background(Circle().fill(.gray))
            }
            
            Text(name)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}

struct PersonPreview_Previews: PreviewProvider {
    static var previews: some View {
        PersonPreview(thumbnail: dev.testCharacter.thumbnail, name: dev.testCharacter.name)
            .frame(width: 120, height: 200)
    }
}
