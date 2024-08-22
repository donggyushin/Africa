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
        ScrollView {
            Image(animal.image, bundle: .init(identifier: "com.donggyu.Browse"))
                .resizable()
                .scaledToFit()
            
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.vertical)
                .fontWeight(.heavy)
                .background {
                    Color.accent
                        .frame(height: 6)
                        .offset(y: 24)
                }
            
            Text(animal.headline)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.accent)
                .padding(.horizontal)
            
            Heading(image: "photo.on.rectangle.angled", text:  "Wilderness in Pictures")
            .padding(.vertical)
            
            Gallery(gallery: animal.gallery)
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Learn about \(animal.name)")
    }
}

#Preview {
    AnimalDetailView(animalId: "lion", animalRepository: AnimalRepositoryPreview())
        .preferredColorScheme(.dark)
}
