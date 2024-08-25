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
    
    init() {
        left = .list
        right = .oneColumn
        selected = .list
    }
    
    var domain: BrowseLayoutDomain {
        var domain = BrowseLayoutDomain()
        domain.right = self.right.domain
        domain.selected = self.selected.domain
        return domain
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
    
    var domain: BrowseLayoutTypeDomain {
        switch self {
        case .list:
            return .list
        case .oneColumn:
            return .oneColumn
        case .twoColumn:
            return .twoColumn
        case .threeColumn:
            return .threeColumn
        }
    }
}

