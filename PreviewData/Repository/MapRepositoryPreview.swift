//
//  MapRepositoryPreview.swift
//  PreviewData
//
//  Created by 신동규 on 8/22/24.
//

import Domain
import Files

public final class MapRepositoryPreview: MapRepository {
    public var locations: [Domain.LocationDomain] {
        LOCATIONS
    }
    
    public init() { }
}
