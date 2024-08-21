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
    
    init(
        browseNavigationPath: Binding<[BrowseNavigation]>,
        selectedTab: Binding<Tab>
    ) {
        browse = .init(browseNavigationPath: browseNavigationPath, selectedTab: selectedTab)
    }
}
