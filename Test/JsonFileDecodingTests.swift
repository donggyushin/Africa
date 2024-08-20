//
//  JsonFileDecodingTests.swift
//  Test
//
//  Created by 신동규 on 8/20/24.
//

import XCTest
import Domain
import Files

final class JsonFileDecodingTests: XCTestCase {
    func testCoverImages() {
        XCTAssertEqual(COVER_IMAGES.count, 7)
    }
}
