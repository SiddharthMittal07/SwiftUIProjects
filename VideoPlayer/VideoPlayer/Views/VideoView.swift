//
//  VideoView.swift
//  VideoPlayer
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    let video: Video
    @State private var player = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                if let link = video.videoFiles.first?.link {
                    player = AVPlayer(url: URL(string: link)!)
                    player.play()
                }
            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: previewVideo)
    }
}
