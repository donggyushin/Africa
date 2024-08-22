//
//  VideoFile.swift
//  Files
//
//  Created by 신동규 on 8/22/24.
//

import Domain

struct VideoFile: Codable {
    let id: String
    let name: String
    let headline: String
    
    init(domain: VideoDomain) {
        id = domain.id
        name = domain.name
        headline = domain.headline
    }
    
    var domain: VideoDomain {
        .init(
            id: id,
            name: name,
            headline: headline
        )
    }
}
