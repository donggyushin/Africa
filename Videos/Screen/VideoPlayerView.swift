//
//  VideoPlayerView.swift
//  Videos
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import Domain
import PreviewData

public struct VideoPlayerView: View {
        
    let video: VideoVideos
    
    public init?(videoRepository: VideoRepository, videoId: String) {
        guard let domain = SearchVideoUseCase(videoRepository: videoRepository).invoke(videoId: videoId) else { return nil }
        self.video = .init(domain: domain)
    }
    
    public var body: some View {
        Text("Video Player View")
    }
}

#Preview {
    VideoPlayerView(videoRepository: VideoRepositoryPreview(), videoId: "cheetah")
        .preferredColorScheme(.dark)
}
