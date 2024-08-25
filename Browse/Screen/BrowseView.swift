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
        ZStack {
            if viewModel.layout.selected == .list {
                AnimalList(
                    covers: viewModel.covers,
                    animals: viewModel.animals
                )
            } else {
                AnimalGrid(
                    layout: viewModel.layout.right,
                    animals: viewModel.animals
                )
            }
        }
        .toolbar {
            LayoutToolbarItem(layout: viewModel.layout.left, selected: viewModel.layout.selected) {
                viewModel.tapLayoutList()
            }
            
            LayoutToolbarItem(layout: viewModel.layout.right, selected: viewModel.layout.selected) {
                viewModel.tapGridList()
            }
        }
        .navigationTitle("Africa")
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
