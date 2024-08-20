//
//  BrowseViewModel.swift
//  Browse
//
//  Created by 신동규 on 8/20/24.
//

import Combine
import Domain

final class BrowseViewModel: ObservableObject {
    
    @Published var covers: [CoverImageBrowse]
    
    private let getAnimalCoversUseCase: GetAnimalCoversUseCase
    
    init(
        animalRepository: AnimalRepository
    ) {
        getAnimalCoversUseCase = .init(animalRepository: animalRepository)
        
        covers = getAnimalCoversUseCase.invoke().map({ .init(domain: $0) })
    }
}
