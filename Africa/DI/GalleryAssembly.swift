//
//  GalleryAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/22/24.
//

import Swinject
import Domain
import Gallery

struct GalleryAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(GalleryView.self) { resolver in
            let animalRepository = resolver.resolve(AnimalRepository.self)!
            return GalleryView(animalRepository: animalRepository)
        }
    }
}
