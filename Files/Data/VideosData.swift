//
//  VideosData.swift
//  Files
//
//  Created by 신동규 on 8/22/24.
//

import Domain

public var VIDEOS: [VideoDomain] {
    guard let bundle = Bundle(identifier: "com.donggyu.Files") else { return [] }
    let result: [VideoFile] = bundle.decode("videos.json")
    return result.map({ $0.domain })
}
