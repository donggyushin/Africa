//
//  GetAnimalsUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/21/24.
//

public final class GetAnimalsUseCase {
    private let animalRepository: AnimalRepository
    
    public init(animalRepository: AnimalRepository) {
        self.animalRepository = animalRepository
    }
    
    public func invoke() -> [AnimalDomain] {
        animalRepository.animals
    }
}
