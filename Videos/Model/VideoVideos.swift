//
//  VideoVideos.swift
//  Videos
//
//  Created by 신동규 on 8/22/24.
//

import Domain

struct VideoVideos: Codable {
    let id: String
    let name: String
    let headline: String
    
    var cover: String {
        "video-\(id)"
    }
    
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

