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
    @State private var selectedTab: Tab = .browse
    
    let browseFactory: () -> BrowseView
    let animalDetailFactory: (String) -> AnimalDetailView?
    
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
        
        switch host {
        case "browse":
            guard let screen, let id else { return }
            switch screen {
            case "detail":
                coordinator.browse.navigateToDetail(animalId: id)
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
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
                .tag(Tab.video)
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
                .tag(Tab.map)
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
                .tag(Tab.gallery)
        }
        .onAppear {
            coordinator = .init(browseNavigationPath: $browseNavigationPath, selectedTab: $selectedTab)
        }
        .onOpenURL { url in
            handleURL(url: url)
        }
    }
}

#Preview {
    
    let animalRepository = AnimalRepositoryPreview()
    
    return ContentView {
        BrowseView(animalRepository: animalRepository)
    } animalDetailFactory: { id in
        AnimalDetailView(animalId: id, animalRepository: animalRepository)
    }
    .preferredColorScheme(.dark)
}
