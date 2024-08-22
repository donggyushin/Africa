//
//  SearchVideoUseCaseTests.swift
//  Test
//
//  Created by 신동규 on 8/22/24.
//

import XCTest
import Domain
import PreviewData

final class SearchVideoUseCaseTests: XCTestCase {
    
    var useCase: SearchVideoUseCase?

    override func setUpWithError() throws {
        useCase = .init(videoRepository: VideoRepositoryPreview())
    }

    override func tearDownWithError() throws {
        useCase = nil
    }

    func testCheetah() {
        XCTAssertNotNil(useCase?.invoke(videoId: "cheetah"))
    }

    func testFail() {
        XCTAssertNil(useCase?.invoke(videoId: ""))
    }

}
