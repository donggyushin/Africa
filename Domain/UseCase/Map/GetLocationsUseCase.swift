//
//  GetLocationsUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public final class GetLocationsUseCase {
    private let mapRepository: MapRepository
    
    public init(mapRepository: MapRepository) {
        self.mapRepository = mapRepository
    }
    
    public func invoke() -> [LocationDomain] {
        mapRepository.locations
    }
}
