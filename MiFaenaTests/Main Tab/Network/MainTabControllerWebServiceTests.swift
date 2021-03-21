//
//  MainTabControllerWebServiceTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/20/21.
//

import XCTest
@testable import MiFaena

class MainTabControllerWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainTabWebService_WhenGivenAValidUserId_ReturnsANotNilUser() {
        let sut = MainTabControllerWebService()
        let userId = "61eucxcF6HaylMBStyhwqAF8Sah1"
        
        let myExpectation = expectation(description: "A not nil user is returned from the server.")
        sut.fetchUser(withId:userId) { user in
            
            XCTAssertNotNil(user, "A nil user was returned given a valid user id.")
            myExpectation.fulfill()
        }
        wait(for: [myExpectation], timeout: 3)
        
    }
    
    func testMainTabWebService_WhenGivenAnInvalidUserId_ReturnANilUser() {
        
        let sut = MainTabControllerWebService()
        let userId = " "
        
        let myExpectation = expectation(description: "A not nil user is returned from the server.")
        sut.fetchUser(withId: userId) { (user) in
            XCTAssertNil(user, "A nil user was expected but a not nil one came from firebase.")
            myExpectation.fulfill()
        }
        wait(for: [myExpectation], timeout: 3)

    }
}
