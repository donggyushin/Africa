//
//  AnimalGallery.swift
//  Gallery
//
//  Created by 신동규 on 8/22/24.
//

import Domain

struct AnimalGallery: Identifiable {
    let id: String
    let name: String
    let image: String
    let gallery: [String]
    
    init(domain: AnimalDomain) {
        id = domain.id
        name = domain.name
        image = domain.image
        gallery = domain.gallery
    }
}


