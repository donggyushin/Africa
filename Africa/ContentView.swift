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
    
    let browseFactory: () -> BrowseView
    
    var body: some View {
        TabView {
            browseFactory()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }
    }
}

#Preview {
    
    let animalRepository = AnimalRepositoryPreview()
    
    return ContentView {
        BrowseView(animalRepository: animalRepository)
    }
    .preferredColorScheme(.dark)
}
