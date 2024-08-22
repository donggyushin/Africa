//
//  MapAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/22/24.
//

import Domain
import Map
import Swinject

struct MapAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(MapView.self) { _ in
            return MapView()
        }
    }
}
