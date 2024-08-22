//
//  AfricaMap.swift
//  Browse
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import MapKit

struct AfricaMap: View {
    
    @State private var position: MapCameraPosition = MapCameraPosition.region(
        .init(
            center: .init(latitude: 6.600286, longitude: 16.4377599),
            span: .init(latitudeDelta: 60, longitudeDelta: 60)
        )
    )
    
    var body: some View {
        Map(position: $position)
            .frame(height: 256)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    AfricaMap()
        .preferredColorScheme(.dark)
}
