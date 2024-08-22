//
//  MainAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import Swinject
import Browse
import Videos
import Map

struct MainAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(ContentView.self) { resolver in
            return  ContentView {
                resolver.resolve(BrowseView.self)!
            } animalDetailFactory: { id in
                resolver.resolve(AnimalDetailView?.self, argument: id)!
            } videoListFactory: {
                resolver.resolve(VideoListView.self)!
            } videoPlayerFactory: { id in
                resolver.resolve(VideoPlayerView?.self, argument: id)!
            } mapFactory: {
                resolver.resolve(MapView.self)!
            }
        }
    }
}
