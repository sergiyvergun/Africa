//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Sergiy Vergun on 23/12/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
    }
}

#Preview {
    VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
}
