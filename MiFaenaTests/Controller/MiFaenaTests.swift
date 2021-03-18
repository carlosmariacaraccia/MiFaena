//
//  MiFaenaTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/16/21.
//

import XCTest
@testable import MiFaena

class MiFaenaTests: XCTestCase {

    private var sut:ViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testViewController_WhenAppLaunchs_ShouldNotBeNil() {
        // given
        // when
        XCTAssertNotNil(sut, "The view controller unexpectedly is nil")
        // then
    }
    
    
}
