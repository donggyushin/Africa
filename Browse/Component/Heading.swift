//
//  Heading.swift
//  Browse
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI

struct Heading: View {
    
    let image: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    Heading(image: "photo.on.rectangle.angled", text: "Wilderness in Pictures")
}
