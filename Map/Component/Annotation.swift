//
//  Annotation.swift
//  Map
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import Domain
import Files

struct Annotation: View {
    
    let location: LocationMap
    @State private var animation: Double = 0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54)
            
            Circle()
                .stroke(Color.accent, lineWidth: 2)
                .frame(width: 52)
                .scaleEffect(1 + animation)
                .opacity(1 - animation)
            
            Image(location.image, bundle: .init(identifier: "com.donggyu.Map"))
                .resizable()
                .scaledToFit()
                .frame(width: 48)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

#Preview {
    Annotation(location: .init(domain: LOCATIONS[0]))
        .preferredColorScheme(.dark)
}
