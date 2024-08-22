//
//  GetVideosUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public final class GetVideosUseCase {
    private let videoRepository: VideoRepository
    
    public init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    public func invoke() -> [VideoDomain] {
        videoRepository.videos
    }
}
