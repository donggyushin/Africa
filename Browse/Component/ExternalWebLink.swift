//
//  ExternalWebLink.swift
//  Browse
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI

struct ExternalWebLink: View {
    
    let title: String
    let link: URL
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer()
                
                Link(destination: link) {
                    Group {
                        Image(systemName: "arrow.up.right.square")
                        Text(title)
                    }
                    .foregroundStyle(.accent)
                }
            }
        }
    }
}

#Preview {
    ExternalWebLink(title: "Lion", link: URL(string: "https://wikipedia.org")!)
}
