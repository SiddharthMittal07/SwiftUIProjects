//
//  EventDetailView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 08/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventDetailView: View {
    
    let event: Event
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            backgroundImage
            eventInfo
            backButton
        }
        .navigationBarHidden(true)
    }
}


extension EventDetailView {
    private var backgroundImage: some View {
        WebImage(url: URL(string: extractImageURL(path: event.thumbnail.path, ext: event.thumbnail.ext)))
            .resizable()
            .overlay(Color.black.opacity(0.5))
            .ignoresSafeArea()
    }
    
    private var eventInfo: some View {
        VStack {
            Spacer()
            Text(event.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding()
                .background(.white)
                .cornerRadius(15)
                .padding()
            
            Text(event.description)
                .font(.headline)
                .padding()
                .background(.white)
                .cornerRadius(20)
                .padding(8)
            if let start = event.start, let end = event.end {
                let startYear = start.components(separatedBy: "-")[0]
                let endYear = end.components(separatedBy: "-")[0]
                Text(startYear == endYear ? startYear : "\(startYear) - \(endYear)")
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .padding()
            }
            Spacer()
        }
        .foregroundColor(.black)
        .multilineTextAlignment(.center)
        .frame(width: UIScreen.main.bounds.width)
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        .padding()
    }
}


struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventDetailView(event: dev.testEvent)
        }
    }
}
