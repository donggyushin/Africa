//
//  BrowseView.swift
//  Browse
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData

public struct BrowseView: View {
    
    @StateObject private var viewModel: BrowseViewModel
    
    public init(animalRepository: AnimalRepository) {
        _viewModel = .init(wrappedValue: .init(animalRepository: animalRepository))
    }
    
    public var body: some View {
        ScrollView {
            Covers(images: viewModel.covers)
                .frame(height: 300)
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
