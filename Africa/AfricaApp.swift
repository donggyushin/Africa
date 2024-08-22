//
//  AfricaApp.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Swinject

@main
struct AfricaApp: App {
    
    let injector: Injector
    
    init() {
        injector = DependencyInjector(container: Container())
        injector.assemble([
            DataAssembly(),
            BrowseAssembly(),
            VideoAssembly(),
            MapAssembly(),
            MainAssembly()
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            injector.resolve(ContentView.self)
        }
    }
}
