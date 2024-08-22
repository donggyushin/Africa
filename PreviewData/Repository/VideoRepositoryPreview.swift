//
//  VideoRepositoryPreview.swift
//  PreviewData
//
//  Created by 신동규 on 8/22/24.
//

import Domain
import Files

public final class VideoRepositoryPreview: VideoRepository {
    public var videos: [Domain.VideoDomain] { VIDEOS }
}
