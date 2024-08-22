//
//  MapView.swift
//  Map
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData
import MapKit

public struct MapView: View {
    
    @StateObject var viewModel: MapViewModel
    
    public init(mapRepository: MapRepository) {
        _viewModel = .init(wrappedValue: .init(mapRepository: mapRepository))
    }
    
    public var body: some View {
        Map {
            ForEach(viewModel.locations) { location in
                Marker(location.name, coordinate: location.coordinate)
                    .tint(.accent)
            }
        }
    }
}

#Preview {
    MapView(mapRepository: MapRepositoryPreview())
        .preferredColorScheme(.dark)
}
