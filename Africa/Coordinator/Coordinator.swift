//
//  Coordinator.swift
//  Africa
//
//  Created by 신동규 on 8/21/24.
//

import SwiftUI

var coordinator: Coordinator?

final class Coordinator {
    
    let browse: BrowseCoordinator
    let videos: VideosCoordinator
    
    init(
        browseNavigationPath: Binding<[BrowseNavigation]>,
        videosNavigationPath: Binding<[VideosNavigation]>,
        selectedTab: Binding<Tab>
    ) {
        browse = .init(browseNavigationPath: browseNavigationPath, selectedTab: selectedTab)
        videos = .init(videosNavigationPath: videosNavigationPath, selectedTab: selectedTab)
    }
}
