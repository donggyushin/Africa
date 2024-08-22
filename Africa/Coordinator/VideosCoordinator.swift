//
//  VideosCoordinator.swift
//  Africa
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI

final class VideosCoordinator {
    @Binding var videosNavigationPath: [VideosNavigation]
    @Binding var selectedTab: Tab
    
    init(
        videosNavigationPath: Binding<[VideosNavigation]>,
        selectedTab: Binding<Tab>
    ) {
        _videosNavigationPath = videosNavigationPath
        _selectedTab = selectedTab
    }
    
    func select() {
        selectedTab = .video
    }
    
    func navigateToPlayer(videoId: String) {
        videosNavigationPath.append(.player(videoId))
    }
}
