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

struct ContentView: View {
    
    let injector: Injector
    
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            BrowseView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            BrowseView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }
    }
}

//#Preview {
//    return ContentView(injector: <#any Injector#>)
//        .preferredColorScheme(.dark)
//}
