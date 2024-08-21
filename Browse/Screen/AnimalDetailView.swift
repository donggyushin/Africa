//
//  AnimalDetailView.swift
//  Browse
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import Domain
import PreviewData

public struct AnimalDetailView: View {
    
    let animal: AnimalBrowse
    
    public init?(
        animalId: String,
        animalRepository: AnimalRepository
    ) {
        guard let domain = SearchAnimalUseCase(animalRepository: animalRepository).invoke(id: animalId) else { return nil }
        animal = .init(domain: domain)
    }
    
    public var body: some View {
        Text("Animal Detail")
    }
}

#Preview {
    AnimalDetailView(animalId: "lion", animalRepository: AnimalRepositoryPreview())
        .preferredColorScheme(.dark)
}
