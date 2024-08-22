//
//  LocationData.swift
//  Files
//
//  Created by 신동규 on 8/22/24.
//

import Domain

public var LOCATIONS: [LocationDomain] {
    guard let bundle = Bundle(identifier: "com.donggyu.Files") else { return [] }
    let result: [LocationFile] = bundle.decode("locations.json")
    return result.map({ $0.domain })
}
