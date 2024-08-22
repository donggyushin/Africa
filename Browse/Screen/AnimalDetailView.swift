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
            
            Group {
                Heading(image: "photo.on.rectangle.angled", text:  "Wilderness in Pictures")
                Gallery(gallery: animal.gallery)
            }
            .padding(.vertical)
            
            Group {
                Heading(image: "questionmark.circle", text:  "Did you know?")
                Facts(facts: animal.fact)
            }
            .padding()
            
            Group {
                Heading(image: "info.circle", text:  "All about \(animal.name)")
                Text(animal.description)
                    .multilineTextAlignment(.leading)
            }
            .padding()
            
            Group {
                Heading(image: "map", text:  "National Park")
                AfricaMap()
            }
            .padding()
            
            if let url = URL(string: animal.link) {
                Group {
                    Heading(image: "books.vertical", text: "Learn More")
                    ExternalWebLink(title: animal.name, link: url)
                }
                .padding()
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Learn about \(animal.name)")
    }
}

#Preview {
    AnimalDetailView(animalId: "lion", animalRepository: AnimalRepositoryPreview())
        .preferredColorScheme(.dark)
}
