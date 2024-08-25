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
            Button {
                viewModel.tapLayoutList()
            } label: {
                Image(systemName: "list.dash")
                    .foregroundStyle(viewModel.layout.selected == .list ? .accent : Color(uiColor: .label))
            }
            
            switch viewModel.layout.right {
            case .list:
                Button {
                    viewModel.tapGridList()
                } label: {
                    Image(systemName: "rectangle.grid.1x2")
                        .foregroundStyle(viewModel.layout.selected == .list ? .accent : Color(uiColor: .label))
                }
            case .oneColumn:
                Button {
                    viewModel.tapGridList()
                } label: {
                    Image(systemName: "rectangle.grid.1x2")
                        .foregroundStyle(viewModel.layout.selected == .oneColumn ? .accent : Color(uiColor: .label))
                }
            case .twoColumn:
                Button {
                    viewModel.tapGridList()
                } label: {
                    Image(systemName: "rectangle.grid.2x2")
                        .foregroundStyle(viewModel.layout.selected == .twoColumn ? .accent : Color(uiColor: .label))
                }
            case .threeColumn:
                Button {
                    viewModel.tapGridList()
                } label: {
                    Image(systemName: "rectangle.grid.3x2")
                        .foregroundStyle(viewModel.layout.selected == .threeColumn ? .accent : Color(uiColor: .label))
                }
            }
        }
        
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
