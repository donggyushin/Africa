//
//  VideoListView.swift
//  Videos
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData
import Common

public struct VideoListView: View {
    
    @StateObject var viewModel: VideoListViewModel
    
    public init(videoRepository: VideoRepository) {
        _viewModel = .init(wrappedValue: .init(videoRepository: videoRepository))
    }
    
    public var body: some View {
        List {
            ForEach(viewModel.videos) { data in
                Button {
                    openURL(url: "dgafrica://videos?screen=video&id=\(data.id)")
                } label: {
                    Thumbnail(data: data)
                        .foregroundStyle(Color(uiColor: .label))
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Videos")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    return NavigationStack {
        VideoListView(videoRepository: VideoRepositoryPreview())
    }
    .preferredColorScheme(.dark)
}
