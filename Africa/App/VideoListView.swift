//
//  VideoListView.swift
//  Africa
//
//  Created by Sergiy Vergun on 25.10.2023.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical,8)
                    }
                }
            }.listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Videos",displayMode: .inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            videos.shuffle()
                            hapticImpact.impactOccurred()
                        }){
                            Image(systemName: "arrow.2.squarepath")
                        }.accessibility(identifier: "shuffleButton")
                    }
                }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
