//
//  SearchAnimalUseCaseTests.swift
//  Test
//
//  Created by 신동규 on 8/21/24.
//

import XCTest
import Domain
import PreviewData

final class SearchAnimalUseCaseTests: XCTestCase {
    
    var useCase: SearchAnimalUseCase?

    override func setUpWithError() throws {
        useCase = .init(animalRepository: AnimalRepositoryPreview())
    }

    override func tearDownWithError() throws {
        useCase = nil
    }

    func testSearchLion() {
        XCTAssertEqual("Lion", useCase?.invoke(id: "lion")?.name)
    }
    
    func testFailToSearch() {
        XCTAssertNil(useCase?.invoke(id: ""))
    }
}
