//
//  GetAnimalCoversUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/20/24.
//

public final class GetAnimalCoversUseCase {
    private let animalRepository: AnimalRepository
    
    public init(animalRepository: AnimalRepository) {
        self.animalRepository = animalRepository
    }
    
    public func invoke() -> [CoverImageDomain] {
        animalRepository.covers
    }
}
