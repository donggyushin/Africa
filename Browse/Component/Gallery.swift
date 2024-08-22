//
//  Gallery.swift
//  Browse
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import Domain
import Files

struct Gallery: View {
    
    let gallery: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(gallery, id: \.self) { image in
                    Image(image, bundle: .init(identifier: "com.donggyu.Browse"))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    return Gallery(gallery: ANIMALS[0].gallery)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
}
