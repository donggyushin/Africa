//
//  VideoListViewModel.swift
//  Videos
//
//  Created by 신동규 on 8/22/24.
//

import Combine
import Domain

final class VideoListViewModel: ObservableObject {
    @Published var videos: [VideoVideos]
    
    private let getVideosUseCase: GetVideosUseCase
    
    init(videoRepository: VideoRepository) {
        getVideosUseCase = .init(videoRepository: videoRepository)
        videos = getVideosUseCase.invoke().map({ .init(domain: $0) })
    }
    
    func shuffle() {
        videos.shuffle()
    }
}
