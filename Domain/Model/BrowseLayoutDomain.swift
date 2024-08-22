//
//  BrowseLayoutDomain.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public struct BrowseLayoutDomain: Equatable {
    public let left: BrowseLayoutTypeDomain
    public var right: BrowseLayoutTypeDomain
    public var selected: BrowseLayoutTypeDomain
    
    public init() {
        self.left = .list
        self.right = .oneColumn
        self.selected = .list
    }
    
}

public enum BrowseLayoutTypeDomain {
    case list
    case oneColumn
    case twoColumn
}
