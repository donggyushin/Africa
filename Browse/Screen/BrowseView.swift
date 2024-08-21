//
//  BrowseView.swift
//  Browse
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData
import Common

public struct BrowseView: View {
    
    @StateObject private var viewModel: BrowseViewModel
    
    public init(animalRepository: AnimalRepository) {
        _viewModel = .init(wrappedValue: .init(animalRepository: animalRepository))
    }
    
    public var body: some View {
        ScrollView {
            Covers(images: viewModel.covers)
                .frame(height: 300)
            
            
            ForEach(viewModel.animals) { data in
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
    return BrowseView(
        animalRepository: AnimalRepositoryPreview()
    )
    .preferredColorScheme(.dark)
}
