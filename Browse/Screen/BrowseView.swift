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
        AnimalList(
            covers: viewModel.covers,
            animals: viewModel.animals
        )
    }
}

#Preview {
    
    return NavigationStack {
        BrowseView(
            animalRepository: AnimalRepositoryPreview()
        )
    }
    .preferredColorScheme(.dark)
}
