//
//  AnimalRepositoryPreview.swift
//  PreviewData
//
//  Created by 신동규 on 8/20/24.
//

import Domain
import Files

public final class AnimalRepositoryPreview: AnimalRepository {
    public var animals: [Domain.AnimalDomain] {
        ANIMALS
    }
    
    public var covers: [Domain.CoverImageDomain] {
        COVER_IMAGES
    }
    
    public init() { }
}
