//
//  CharacterPreview.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterPreview: View {
    
    let character: Character
    
    var body: some View {
        HStack(alignment: .top) {
            WebImage(url: URL(string: extractImageURL(path: character.thumbnail.path, ext: character.thumbnail.ext)))
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
  
            VStack(alignment: .leading, spacing: 7) {
                Text(character.name)
                    .font(.headline)
                
                Text(character.description.count == 0 ? "No Description" : character.description)
                    .font(.caption)
                    .lineLimit(4)
                
                HStack {
                    ForEach(character.urls, id: \.type) { link in
                        Text(link.type.capitalized)
                            .foregroundColor(.white)
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .padding(7)
                            .background(Capsule().fill(
                                link.type == "detail" ? Color.green :
                                    link.type == "wiki" ? Color.blue : Color.orange
                            ))
                    }
                }
            }
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding()
        .background(.white)
        .cornerRadius(20)
    }
}

struct CharacterPreview_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPreview(character: dev.testCharacter)
            .previewLayout(.sizeThatFits)
            .background(Color.black.opacity(0.1))
    }
}
