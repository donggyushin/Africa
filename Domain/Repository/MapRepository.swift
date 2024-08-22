//
//  MapRepository.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public protocol MapRepository {
    var locations: [LocationDomain] { get }
}
