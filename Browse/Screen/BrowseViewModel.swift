//
//  BrowseViewModel.swift
//  Browse
//
//  Created by 신동규 on 8/20/24.
//

import Combine
import Domain

final class BrowseViewModel: ObservableObject {
    
    @Published var animals: [AnimalBrowse]
    @Published var covers: [CoverImageBrowse]
    
    private let getAnimalCoversUseCase: GetAnimalCoversUseCase
    private let getAnimalsUseCase: GetAnimalsUseCase
    
    init(
        animalRepository: AnimalRepository
    ) {
        getAnimalCoversUseCase = .init(animalRepository: animalRepository)
        getAnimalsUseCase = .init(animalRepository: animalRepository)
        
        animals = getAnimalsUseCase.invoke().map({ .init(domain: $0) })
        covers = getAnimalCoversUseCase.invoke().map({ .init(domain: $0) })
    }
}
