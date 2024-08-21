//
//  AnimalsData.swift
//  Files
//
//  Created by 신동규 on 8/21/24.
//

import Domain

public var ANIMALS: [AnimalDomain] {
    guard let bundle = Bundle(identifier: "com.donggyu.Files") else { return [] }
    let result: [AnimalFile] = bundle.decode("animals.json")
    return result.map({ $0.domain })
}
