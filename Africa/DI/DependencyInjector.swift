//
//  DependencyInjector.swift
//  Africa
//
//  Created by 신동규 on 8/20/24.
//

import Swinject

/// DI 대상 등록
protocol DependencyAssemblable {
    func assemble(_ assemblyList: [Assembly])
}

/// DI 등록한 서비스 사용
protocol DependencyResolvable {
    func resolve<T>(_ serviceType: T.Type) -> T
    func resolve<T, Arg1>(_ serviceType: T.Type, argument: Arg1) -> T
    func resolve<T, Arg1, Arg2>(_ serviceType: T.Type, arguments arg1: Arg1, _ arg2: Arg2) -> T
}

typealias Injector = DependencyAssemblable & DependencyResolvable

final class DependencyInjector: Injector {
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func assemble(_ assemblyList: [any Swinject.Assembly]) {
        assemblyList.forEach({
            $0.assemble(container: container)
        })
    }
    
    func resolve<T>(_ serviceType: T.Type) -> T {
        container.resolve(serviceType)!
    }
    
    // 한 개의 인수를 처리하는 resolve 함수
    func resolve<T, Arg1>(_ serviceType: T.Type, argument: Arg1) -> T {
        container.resolve(serviceType, argument: argument)!
    }

    // 두 개의 인수를 처리하는 resolve 함수
    func resolve<T, Arg1, Arg2>(_ serviceType: T.Type, arguments arg1: Arg1, _ arg2: Arg2) -> T {
        container.resolve(serviceType, arguments: arg1, arg2)!
    }
}
