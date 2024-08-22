//
//  VideoDomain.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public struct VideoDomain {
    public let id: String
    public let name: String
    public let headline: String
    
    public init(id: String, name: String, headline: String) {
        self.id = id
        self.name = name
        self.headline = headline
    }
}
