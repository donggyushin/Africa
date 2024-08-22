//
//  GalleryViewModel.swift
//  Gallery
//
//  Created by 신동규 on 8/22/24.
//

import Combine
import Domain

final class GalleryViewModel: ObservableObject {
    @Published var animals: [AnimalGallery]
    
    private let getAnimalsUseCase: GetAnimalsUseCase
    
    init(animalRepository: AnimalRepository) {
        getAnimalsUseCase = .init(animalRepository: animalRepository)
        animals = getAnimalsUseCase.invoke().map({ .init(domain: $0) })
    }
}
