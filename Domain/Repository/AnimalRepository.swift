//
//  AnimalRepository.swift
//  Domain
//
//  Created by 신동규 on 8/20/24.
//

public protocol AnimalRepository {
    var animals: [AnimalDomain] { get }
    var covers: [CoverImageDomain] { get }
}
