//
//  MainTabValidatorTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import XCTest
@testable import MiFaena

class MainTabValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainTabValidator_WhenUserIsSignedIn_ReturnsUserId() {
        
        // given
        let sut = MainTabValidator()
        
        // when
        let userId = sut.isUserSignedIn()
        
        XCTAssertNotNil(userId, "The user id was nil when it was not suppossed to.")
        
    }
}
