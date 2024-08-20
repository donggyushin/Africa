//
//  AnimalRepositoryData.swift
//  DataSource
//
//  Created by 신동규 on 8/20/24.
//

import Domain
import Files

public final class AnimalRepositoryData: AnimalRepository {
    public var covers: [Domain.CoverImageDomain] {
        COVER_IMAGES
    }
}
