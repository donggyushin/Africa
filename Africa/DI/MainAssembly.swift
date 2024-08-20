//
//  MainAssembly.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import Swinject

public struct MainAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.register(ContentView.self) { _ in
            return ContentView()
        }
    }
}
