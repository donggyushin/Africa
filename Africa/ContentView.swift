//
//  ContentView.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Browse
import Videos
import Map
import Gallery
import PreviewData

struct ContentView: View {
    
    @State private var browseNavigationPath: [BrowseNavigation] = []
    @State private var videosNavigationPath: [VideosNavigation] = []
    @State private var selectedTab: Tab = .browse
    
    let browseFactory: () -> BrowseView
    let animalDetailFactory: (String) -> AnimalDetailView?
    
    let videoListFactory: () -> VideoListView
    let videoPlayerFactory: (String) -> VideoPlayerView?
    
    let mapFactory: () -> MapView
    
    let galleryFactory: () -> GalleryView
    
    private func handleURL(url: URL) {
        guard let host = url.host() else { return }
        
        guard let coordinator else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                handleURL(url: url)
            }
            return
        }
        
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queries = urlComponents?.queryItems
        
        let screen: String? = queries?.first(where: { $0.name == "screen" })?.value
        let id: String? = queries?.first(where: { $0.name == "id" })?.value
        
        guard let screen else {
            
            switch host {
            case "browse":
                coordinator.browse.select()
            case "videos":
                coordinator.videos.select()
            case "map":
                coordinator.map.select()
            case "gallery":
                coordinator.gallery.select()
            default:
                break
            }
            
            return
        }
        
        switch host {
        case "browse":
            switch screen {
            case "detail":
                guard let id else { return }
                coordinator.browse.navigateToDetail(animalId: id)
            default: break
            }
        case "videos":
            switch screen {
            case "player":
                guard let id else { return }
                coordinator.videos.navigateToPlayer(videoId: id)
            default: break
            }
        default: break
        }
    }
    
    var body: some View {
        TabView {
            NavigationStack(path: $browseNavigationPath) {
                browseFactory()
                    .navigationDestination(for: BrowseNavigation.self) { navigation in
                        switch navigation {
                        case .detail(let id):
                            animalDetailFactory(id)?
                                .toolbar(.hidden, for: .tabBar)
                        }
                    }
            }
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Browse")
            }
            .tag(Tab.browse)
            
            NavigationStack(path: $videosNavigationPath) {
                videoListFactory()
                    .navigationDestination(for: VideosNavigation.self) { navigation in
                        switch navigation {
                        case .player(let id):
                            videoPlayerFactory(id)?
                                .toolbar(.hidden, for: .tabBar)
                        }
                    }
                    
            }
            .tabItem {
                Image(systemName: "play.rectangle")
                Text("Watch")
            }
            .tag(Tab.video)
            
            
            mapFactory()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
                .tag(Tab.map)
            
            galleryFactory()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
                .tag(Tab.gallery)
        }
        .onAppear {
            coordinator = .init(
                browseNavigationPath: $browseNavigationPath,
                videosNavigationPath: $videosNavigationPath,
                selectedTab: $selectedTab
            )
        }
        .onOpenURL { url in
            handleURL(url: url)
        }
    }
}

#Preview {
    
    let animalRepository = AnimalRepositoryPreview()
    let videoRepository = VideoRepositoryPreview()
    let mapRepository = MapRepositoryPreview()
    
    return ContentView {
        BrowseView(animalRepository: animalRepository)
    } animalDetailFactory: { id in
        AnimalDetailView(animalId: id, animalRepository: animalRepository)
    } videoListFactory: {
        VideoListView(videoRepository: videoRepository)
    } videoPlayerFactory: { id in
        VideoPlayerView(videoRepository: videoRepository, videoId: id)
    } mapFactory: {
        MapView(mapRepository: mapRepository)
    } galleryFactory: {
        GalleryView(animalRepository: animalRepository)
    }
    .preferredColorScheme(.dark)
}
