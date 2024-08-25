//
//  UpdateBrowseLayoutUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public final class UpdateBrowseLayoutUseCase {
    public init() { }
    
    public func invoke(layout: BrowseLayoutDomain, tap: BrowseLayoutTypeDomain) -> BrowseLayoutDomain {
        var result = layout
        
        switch tap {
        case .list:
            result.selected = .list
        case .oneColumn:
            if result.selected == .list {
                result.right = .oneColumn
                result.selected = .oneColumn
            } else {
                result.right = .twoColumn
                result.selected = .twoColumn
            }
        case .twoColumn:
            if result.selected == .list {
                result.right = .twoColumn
                result.selected = .twoColumn
            } else {
                result.right = .threeColumn
                result.selected = .threeColumn
            }
        case .threeColumn:
            if result.selected == .list {
                result.right = .threeColumn
                result.selected = .threeColumn
            } else {
                result.right = .oneColumn
                result.selected = .oneColumn
            }
        }
        
        return result
    }
}
