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
            
            HStack {
                Image(systemName: "photo.on.rectangle.angled")
                    .foregroundStyle(.accent)
                    .imageScale(.large)
                
                Text("Wilderness in Pictures")
                    .font(.title3)
                    .fontWeight(.bold)
            }
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
