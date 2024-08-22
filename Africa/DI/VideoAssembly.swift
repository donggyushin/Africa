//
//  VideoAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/22/24.
//

import Swinject
import Domain
import Videos

struct VideoAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(VideoListView.self) { resolver in
            let videoRepository: VideoRepository = resolver.resolve(VideoRepository.self)!
            return VideoListView(videoRepository: videoRepository)
        }
    }
}
