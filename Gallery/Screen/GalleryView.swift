//
//  GalleryView.swift
//  Gallery
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData

public struct GalleryView: View {
    
    @StateObject var viewModel: GalleryViewModel
    
    public init(animalRepository: AnimalRepository) {
        _viewModel = .init(wrappedValue: .init(animalRepository: animalRepository))
    }
    
    public var body: some View {
        Text("Gallery")
    }
}

#Preview {
    GalleryView(animalRepository: AnimalRepositoryPreview())
        .preferredColorScheme(.dark)
}
