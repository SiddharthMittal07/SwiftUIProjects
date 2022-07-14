//
//  EventsView.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 08/07/22.
//

import SwiftUI

struct EventsView: View {
    
    @StateObject private var vm = EventsViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                if vm.events.count == 0 {
                    ProgressView()
                        .padding(.top, 40)
                } else {
                    eventStack
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.black.opacity(0.1).ignoresSafeArea())
    }
}


extension EventsView {
    private var eventStack: some View {
        ForEach(vm.events.indices, id: \.self) { index in
            NavigationLink {
                EventDetailView(event: vm.events[index])
            } label: {
                EventPreview(event: vm.events[index], index: index)
                    .padding(.horizontal)
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventsView()
                .navigationTitle("Marvel Events")
        }
    }
}
