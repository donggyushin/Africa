//
//  LocationFile.swift
//  Files
//
//  Created by 신동규 on 8/22/24.
//

import Domain

struct LocationFile: Codable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    init(domain: LocationDomain) {
        id = domain.id
        name = domain.name
        image = domain.image
        latitude = domain.latitude
        longitude = domain.longitude
    }
    
    var domain: LocationDomain {
        .init(
            id: id,
            name: name,
            image: image,
            latitude: latitude,
            longitude: longitude
        )
    }
}
