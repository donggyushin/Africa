//
//  LayoutToolbarItem.swift
//  Browse
//
//  Created by 신동규 on 8/25/24.
//

import SwiftUI

struct LayoutToolbarItem: View {
    
    let layout: BrowseLayoutTypeBrowse
    let selected: BrowseLayoutTypeBrowse
    let action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: layout.systemImageName)
                .foregroundStyle(selected == layout ? .accent : Color(uiColor: .label))
        }
    }
}

#Preview {
    LayoutToolbarItem(layout: .list, selected: .oneColumn, action: nil)
}
