//
//  MapCoordinator.swift
//  Africa
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI

final class MapCoordinator {
    @Binding var selectedTab: Tab
    
    init(
        selectedTab: Binding<Tab>
    ) {
        _selectedTab = selectedTab
    }
    
    func select() {
        selectedTab = .map
    }
}
