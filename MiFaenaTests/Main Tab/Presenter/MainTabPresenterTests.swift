//
//  MainTabPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import XCTest
@testable import MiFaena

class MainTabPresenterTests: XCTestCase {
    
    var mockMainTabValidator: MockMainTabValidator!
    var mockMainTabWebService: MockMainTabWebService!
    var mockDelegate: MockMainTabViewDelegate!
    var sut:MainTabPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockMainTabValidator = MockMainTabValidator()
        mockMainTabWebService = MockMainTabWebService()
        mockDelegate = MockMainTabViewDelegate()
        sut = MainTabPresenter(mainTabValidator: mockMainTabValidator, mainTabWebService: mockMainTabWebService, delegate: mockDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockMainTabValidator = nil
        mockMainTabWebService = nil
        mockDelegate = nil
        sut = nil
    }
    
    
    func testMainTabPresenter_WhenInformed_WillValidateIfTheUserIsSignedIn() {
        // Given
        
        // When
        sut.processIsUserSignedIn()
        
        // Then
        XCTAssertTrue(mockMainTabValidator.userIsLoggedIn, "The user was supposed to be logged in, but it was not.")
        
    }
    
    func testMainTabPresenter_WhenGivenASignedInUserId_ShouldCallFetchUserMethod() {
        
        sut.processIsUserSignedIn()
        
        // Then
        XCTAssertTrue(mockMainTabWebService.isFetchUserCalled, "The user was supposed to be logged in, but it was not.")

    }
    
    func testMainTabPresenter_WhenTheUserWasFetchedCorrectly_PassesTheUserOnAViewDelegateMethod() {
        
        // Given
        let newExpectation = expectation(description: "Pass the user on a delegate method(). ")
        mockDelegate.expectation = newExpectation
        sut.processIsUserSignedIn()
        
        // When
        self.wait(for: [newExpectation], timeout: 4)
        
    }
    
}
