//
//  BrowseLayoutBrowse.swift
//  Browse
//
//  Created by 신동규 on 8/25/24.
//

import Domain

struct BrowseLayoutBrowse: Equatable {
    let left: BrowseLayoutTypeBrowse
    let right: BrowseLayoutTypeBrowse
    let selected: BrowseLayoutTypeBrowse
    
    init(domain: BrowseLayoutDomain) {
        left = .init(domain: domain.left)
        right = .init(domain: domain.right)
        selected = .init(domain: domain.selected)
    }
}

enum BrowseLayoutTypeBrowse {
    case list
    case oneColumn
    case twoColumn
    case threeColumn
    
    init(domain: BrowseLayoutTypeDomain) {
        switch domain {
        case .list:
            self = .list
        case .oneColumn:
            self = .oneColumn
        case .twoColumn:
            self = .twoColumn
        case .threeColumn:
            self = .threeColumn
        @unknown default:
            fatalError()
        }
    }
}

