//
//  Covers.swift
//  Browse
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import Files

struct Covers: View {
    
    let images: [CoverImageBrowse]
    
    var body: some View {
        TabView {
            ForEach(images) { image in
                VStack {
                    Image(image.name, bundle: .init(identifier: "com.donggyu.Browse"))
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    return Covers(images: COVER_IMAGES.map({ .init(domain: $0) }))
        .previewLayout(.fixed(width: 400, height: 300))
        .preferredColorScheme(.dark)
}
