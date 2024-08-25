//
//  BrowseViewModel.swift
//  Browse
//
//  Created by 신동규 on 8/20/24.
//

import Combine
import Domain
import SwiftUI

final class BrowseViewModel: ObservableObject {
    
    @Published var animals: [AnimalBrowse]
    @Published var covers: [CoverImageBrowse]
    @Published var layout: BrowseLayoutBrowse = .init()
    
    private let getAnimalCoversUseCase: GetAnimalCoversUseCase
    private let getAnimalsUseCase: GetAnimalsUseCase
    private let updateBrowseLayoutUseCase: UpdateBrowseLayoutUseCase
    
    init(
        animalRepository: AnimalRepository
    ) {
        getAnimalCoversUseCase = .init(animalRepository: animalRepository)
        getAnimalsUseCase = .init(animalRepository: animalRepository)
        updateBrowseLayoutUseCase = .init()
        
        animals = getAnimalsUseCase.invoke().map({ .init(domain: $0) })
        covers = getAnimalCoversUseCase.invoke().map({ .init(domain: $0) })
    }
    
    func tapLayoutList() {
        withAnimation {
            layout = .init(domain: updateBrowseLayoutUseCase.invoke(layout: layout.domain, tap: layout.left.domain))
        }
    }
    
    func tapGridList() {
        withAnimation {
            layout = .init(domain: updateBrowseLayoutUseCase.invoke(layout: layout.domain, tap: layout.right.domain))
        }
    }
}
