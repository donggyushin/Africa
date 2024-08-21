//
//  AnimalListItem.swift
//  Browse
//
//  Created by 신동규 on 8/21/24.
//

import SwiftUI
import Domain
import Files

struct AnimalListItem: View {
    
    let data: AnimalBrowse
    
    var body: some View {
        HStack(spacing: 16) {
            Image(data.image, bundle: .init(identifier: "com.donggyu.Browse"))
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Spacer()
                
                Text(data.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)
            }
        }
        .frame(height: 90)
    }
}

#Preview {
    AnimalListItem(data: .init(domain: ANIMALS.first!))
        .preferredColorScheme(.dark)
}
