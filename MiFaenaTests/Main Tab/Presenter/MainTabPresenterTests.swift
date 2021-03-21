//
//  MainTabPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import XCTest
@testable import MiFaena

class MainTabPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testMainTabPresenter_WhenInformed_WillValidateIfTheUserIsSignedIn() {
        // Given
        
        let mockMainTabValidator = MockMainTabValidator()
        let sut = MainTabPresenter(mainTabValidator: mockMainTabValidator)
        
        // When
        sut.processIsUserSignedIn()
        
        // Then
        XCTAssertTrue(mockMainTabValidator.userIsLoggedIn, "The user was supposed to be logged in, but it was not.")
        
    }
    
    


}
