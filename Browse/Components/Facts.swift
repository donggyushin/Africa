//
//  Facts.swift
//  Browse
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import Domain
import Files

struct Facts: View {
    
    let facts: [String]
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(facts, id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    }
}

#Preview {
    return Facts(facts: ANIMALS[0].fact)
}
