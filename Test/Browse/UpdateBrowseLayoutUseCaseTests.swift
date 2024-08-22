//
//  UpdateBrowseLayoutUseCaseTests.swift
//  Test
//
//  Created by 신동규 on 8/22/24.
//

import XCTest
import Domain

final class UpdateBrowseLayoutUseCaseTests: XCTestCase {
    
    var useCase: UpdateBrowseLayoutUseCase?

    override func setUpWithError() throws {
        useCase = .init()
    }

    override func tearDownWithError() throws {
        useCase = nil
    }

    func test_tap_list_when_list() throws {
        
        var layout = BrowseLayoutDomain()
        layout.selected = .list
        
        let result = useCase?.invoke(layout: layout, tap: .list)
        let expect = layout
        
        XCTAssertEqual(result, expect)
    }
    
    func test_tap_list_when_column() throws {
        var layout = BrowseLayoutDomain()
        layout.selected = .oneColumn
        
        let result = useCase?.invoke(layout: layout, tap: .list)
        var expect = layout
        expect.selected = .list
        
        XCTAssertEqual(result, expect)
    }
    
    func test_tap_column_when_list() throws {
        var layout = BrowseLayoutDomain()
        layout.selected = .list
        
        let result = useCase?.invoke(layout: layout, tap: .oneColumn)
        var expect = layout
        expect.selected = .oneColumn
        
        XCTAssertEqual(result, expect)
    }
    
    func test_tap_column_when_column() throws {
        var layout = BrowseLayoutDomain()
        layout.selected = .oneColumn
        
        let result = useCase?.invoke(layout: layout, tap: .oneColumn)
        var expect = layout
        expect.selected = .twoColumn
        expect.right = .twoColumn
        
        XCTAssertEqual(result, expect)
    }
    
    func test_tap_column_when_two_column() {
        var layout = BrowseLayoutDomain()
        layout.right = .twoColumn
        layout.selected = .twoColumn
        
        let result = useCase?.invoke(layout: layout, tap: .twoColumn)
        var expect = layout
        expect.selected = .oneColumn
        expect.right = .oneColumn
        
        XCTAssertEqual(result, expect)
    }
}
