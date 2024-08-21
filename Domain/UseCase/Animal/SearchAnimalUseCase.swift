//
//  SearchAnimalUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/21/24.
//

public final class SearchAnimalUseCase {
    private let animalRepository: AnimalRepository
    
    public init(animalRepository: AnimalRepository) {
        self.animalRepository = animalRepository
    }
    
    public func invoke(id: String) -> AnimalDomain? {
        let animals = animalRepository.animals
        return animals.first(where: { $0.id == id })
    }
}
