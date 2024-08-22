//
//  BrowseCoordinator.swift
//  Africa
//
//  Created by 신동규 on 8/21/24.
//

import SwiftUI

final class BrowseCoordinator {
    @Binding var browseNavigationPath: [BrowseNavigation]
    @Binding var selectedTab: Tab
    
    init(
        browseNavigationPath: Binding<[BrowseNavigation]>,
        selectedTab: Binding<Tab>
    ) {
        _browseNavigationPath = browseNavigationPath
        _selectedTab = selectedTab
    }
    
    func select() {
        selectedTab = .browse
    }
    
    func navigateToDetail(animalId: String) {
        select()
        browseNavigationPath.append(.detail(animalId))
    }
}
