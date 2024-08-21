//
//  AnimalDomain.swift
//  Domain
//
//  Created by 신동규 on 8/21/24.
//

public struct AnimalDomain {
    public let id: String
    public let name: String
    public let headline: String
    public let description: String
    public let link: String
    public let image: String
    public let gallery: [String]
    public let fact: [String]
    
    public init(id: String, name: String, headline: String, description: String, link: String, image: String, gallery: [String], fact: [String]) {
        self.id = id
        self.name = name
        self.headline = headline
        self.description = description
        self.link = link
        self.image = image
        self.gallery = gallery
        self.fact = fact
    }
}
