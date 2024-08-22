//
//  AnimalBrowse.swift
//  Browse
//
//  Created by 신동규 on 8/21/24.
//

import Domain

struct AnimalBrowse: Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    
    init(domain: AnimalDomain) {
        id = domain.id
        name = domain.name
        headline = domain.headline
        description = domain.description
        link = domain.link
        image = domain.image
        gallery = domain.gallery
        fact = domain.fact
    }
}

