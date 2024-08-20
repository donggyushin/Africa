//
//  DataAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import Swinject
import Domain
import DataSource

public struct DataAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.register(AnimalRepository.self) { _ in
            AnimalRepositoryData()
        }
    }
}
