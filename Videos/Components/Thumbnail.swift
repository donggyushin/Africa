//
//  Thumbnail.swift
//  Videos
//
//  Created by 신동규 on 8/22/24.
//

import SwiftUI
import Domain
import Files

struct Thumbnail: View {
    
    let data: VideoVideos
    
    var body: some View {
        HStack {
            ZStack {
                Image(data.cover, bundle: .init(identifier: "com.donggyu.Videos"))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(data.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(data.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
            }
        }
    }
}

#Preview {
    return Thumbnail(data: .init(domain: VIDEOS[0]))
        .preferredColorScheme(.dark)
}
