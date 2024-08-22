//
//  VideoRepository.swift
//  Domain
//
//  Created by 신동규 on 8/22/24.
//

public protocol VideoRepository {
    var videos: [VideoDomain] { get }
}
