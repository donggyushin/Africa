//
//  CoverImageData.swift
//  DataSource
//
//  Created by 신동규 on 8/20/24.
//

import Domain

struct CoverImageData: Codable {
    let id: Int
    let name: String
    
    init(domain: CoverImageDomain) {
        id = domain.id
        name = domain.name
    }
    
    var domain: CoverImageDomain {
        .init(id: id, name: name)
    }
}
