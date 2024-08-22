//
//  BrowseAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import Browse
import Swinject
import Domain

struct BrowseAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(BrowseView.self) { resolver in
            let animalRepository = resolver.resolve(AnimalRepository.self)!
            return BrowseView(animalRepository: animalRepository)
        }
        
        container.register(AnimalDetailView?.self) { resolver, id in
            let animalRepository = resolver.resolve(AnimalRepository.self)!
            return AnimalDetailView(animalId: id, animalRepository: animalRepository)
        }
    }
}
