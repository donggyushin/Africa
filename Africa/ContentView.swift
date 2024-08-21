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
    
    var body: some View {
        TabView {
            NavigationStack(path: $browseNavigationPath) {
                browseFactory()
                    .navigationDestination(for: BrowseNavigation.self) { navigation in
                        switch navigation {
                        case .detail(let id):
                            animalDetailFactory(id)
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
