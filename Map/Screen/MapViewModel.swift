//
//  MapViewModel.swift
//  Map
//
//  Created by 신동규 on 8/22/24.
//

import Combine
import Domain

final class MapViewModel: ObservableObject {
    @Published var locations: [LocationMap]
    
    private let getLocationsUseCase: GetLocationsUseCase
    
    init(mapRepository: MapRepository) {
        getLocationsUseCase = .init(mapRepository: mapRepository)
        locations = getLocationsUseCase.invoke().map({ .init(domain: $0) })
    }
}
