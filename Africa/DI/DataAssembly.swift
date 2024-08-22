//
//  DataAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import Swinject
import Domain
import DataSource

struct DataAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(AnimalRepository.self) { _ in
            AnimalRepositoryData()
        }
        
        container.register(VideoRepository.self) { _ in
            return VideoRepositoryData()
        }
        
        container.register(MapRepository.self) { _ in
            return MapRepositoryData()
        }
    }
}
