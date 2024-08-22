//
//  VideoPlayerView.swift
//  Videos
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import Domain
import PreviewData
import AVKit

public struct VideoPlayerView: View {
        
    let video: VideoVideos
    
    public init?(videoRepository: VideoRepository, videoId: String) {
        guard let domain = SearchVideoUseCase(videoRepository: videoRepository).invoke(videoId: videoId) else { return nil }
        self.video = .init(domain: domain)
    }
    
    public var body: some View {
        
        if let url = Bundle(identifier: "com.donggyu.Files")?.url(forResource: video.id, withExtension: "mp4") {
            VideoPlayer(
                player: .init(
                    url: url
                )
            )
            .overlay(alignment: .topLeading) {
                Image("logo", bundle: .init(identifier: "com.donggyu.Videos"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
            .navigationTitle(video.name)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Text("Can't find URL")
        }
        
        
    }
}

#Preview {
    NavigationStack {
        VideoPlayerView(videoRepository: VideoRepositoryPreview(), videoId: "cheetah")
    }
    .preferredColorScheme(.dark)
}
