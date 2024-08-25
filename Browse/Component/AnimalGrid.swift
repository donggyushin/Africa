//
//  AnimalGrid.swift
//  Browse
//
//  Created by 신동규 on 8/25/24.
//

import SwiftUI
import Domain
import PreviewData
import Common

struct AnimalGrid: View {
    
    let layout: BrowseLayoutTypeBrowse
    let animals: [AnimalBrowse]
    
    private var gridLayout: [GridItem] {
        
        let count: Int
        
        switch layout {
        case .list:
            count = 1
        case .oneColumn:
            count = 1
        case .twoColumn:
            count = 2
        case .threeColumn:
            count = 3
        }
        
        return Array(repeating: GridItem(.flexible()), count: count)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout) {
                ForEach(animals) { data in
                    Button {
                        Common.openURL(url: "dgafrica://browse?screen=detail&id=\(data.id)")
                    } label: {
                        Image(data.image, bundle: .init(identifier: "com.donggyu.Browse"))
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    
    let getAnimalsUseCase = GetAnimalsUseCase(animalRepository: AnimalRepositoryPreview())
    
    return AnimalGrid(layout: .twoColumn, animals: getAnimalsUseCase.invoke().map({ .init(domain: $0) }))
        .preferredColorScheme(.dark)
}
