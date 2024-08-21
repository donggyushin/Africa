//
//  MainAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import Swinject
import Browse

public struct MainAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.register(ContentView.self) { resolver in
            return  ContentView {
                resolver.resolve(BrowseView.self)!
            } animalDetailFactory: { id in
                resolver.resolve(AnimalDetailView?.self, argument: id)!
            }
        }
    }
}
