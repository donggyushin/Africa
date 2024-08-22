//
//  SearchVideoUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public final class SearchVideoUseCase {
    private let videoRepository: VideoRepository
    
    public init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    public func invoke(videoId: String) -> VideoDomain? {
        videoRepository.videos.first(where: { $0.id == videoId })
    }
}
