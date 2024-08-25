//
//  AnimalList.swift
//  Browse
//
//  Created by 신동규 on 8/25/24.
//

import SwiftUI
import Common
import Domain
import PreviewData

struct AnimalList: View {
    
    let covers: [CoverImageBrowse]
    let animals: [AnimalBrowse]
    
    var body: some View {
        ScrollView {
            Covers(images: covers)
                .frame(height: 300)
            
            
            ForEach(animals) { data in
                Button {
                    Common.openURL(url: "dgafrica://browse?screen=detail&id=\(data.id)")
                } label: {
                    AnimalListItem(data: data)
                        .foregroundStyle(Color(uiColor: .label))
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    
    let getAnimalCoversUseCase = GetAnimalCoversUseCase(animalRepository: AnimalRepositoryPreview())
    let getAnimalsUseCase = GetAnimalsUseCase(animalRepository: AnimalRepositoryPreview())
    
    return AnimalList(
        covers: getAnimalCoversUseCase.invoke().map({ .init(domain: $0) }),
        animals: getAnimalsUseCase.invoke().map({ .init(domain: $0) })
    )
    .preferredColorScheme(.dark)
}
