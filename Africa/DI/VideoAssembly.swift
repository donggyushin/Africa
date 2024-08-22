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
        container.register(VideoListView.self) { _ in
            return VideoListView()
        }
    }
}
