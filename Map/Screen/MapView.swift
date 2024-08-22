//
//  MapView.swift
//  Map
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData

public struct MapView: View {
    
    @StateObject var viewModel: MapViewModel
    
    public init(mapRepository: MapRepository) {
        _viewModel = .init(wrappedValue: .init(mapRepository: mapRepository))
    }
    
    public var body: some View {
        Text("Map")
    }
}

#Preview {
    MapView(mapRepository: MapRepositoryPreview())
        .preferredColorScheme(.dark)
}
