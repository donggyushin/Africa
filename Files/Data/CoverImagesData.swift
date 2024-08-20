//
//  CoverImagesData.swift
//  Files
//
//  Created by 신동규 on 8/20/24.
//

import Domain

public var COVER_IMAGES: [CoverImageDomain] {
    guard let bundle = Bundle(identifier: "com.donggyu.Files") else { return [] }
    let result: [CoverImageFile] = bundle.decode("covers.json")
    return result.map({ $0.domain })
}
