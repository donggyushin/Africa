//
//  CoverImageBrowse.swift
//  Browse
//
//  Created by 신동규 on 8/20/24.
//

import Domain

struct CoverImageBrowse: Identifiable {
    let id: Int
    let name: String
    
    init(domain: CoverImageDomain) {
        id = domain.id
        name = domain.name
    }
}
