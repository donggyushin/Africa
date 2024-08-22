//
//  VideoListView.swift
//  Videos
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData

public struct VideoListView: View {
    
    @StateObject var viewModel: VideoListViewModel
    
    public init(videoRepository: VideoRepository) {
        _viewModel = .init(wrappedValue: .init(videoRepository: videoRepository))
    }
    
    public var body: some View {
        Text("Video List")
    }
}

#Preview {
    return VideoListView(videoRepository: VideoRepositoryPreview())
        .preferredColorScheme(.dark)
}
