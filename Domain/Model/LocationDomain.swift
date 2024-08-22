//
//  LocationDomain.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public struct LocationDomain {
    public let id: String
    public let name: String
    public let image: String
    public let latitude: Double
    public let longitude: Double
    
    public init(id: String, name: String, image: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }
}
