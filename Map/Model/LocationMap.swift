//
//  LocationMap.swift
//  Map
//
//  Created by 신동규 on 8/22/24.
//

import Domain
import SwiftUI
import CoreLocation

struct LocationMap: Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        .init(
            latitude: latitude,
            longitude: longitude
        )
    }
    
    init(domain: LocationDomain) {
        id = domain.id
        name = domain.name
        image = domain.image
        latitude = domain.latitude
        longitude = domain.longitude
    }
}

