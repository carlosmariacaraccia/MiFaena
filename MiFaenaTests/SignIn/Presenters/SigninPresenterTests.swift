//
//  SigninPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import XCTest
@testable import MiFaena


class SigninPresenterTests: XCTestCase {

    var signinFormModel:SigninFormModel!
    var mockSigninFormModelValidator:MockSigninModelValidator!
    var mockSigninWebService:MockSigninWebService!
    var mockSigninViewDelegate:MockSigninViewDelegate!
    var sut:SigninPresenter!
    
    override func setUpWithError() throws {
        
        signinFormModel = SigninFormModel(email: "test@test.com", password: "clarinmiente")
        mockSigninWebService = MockSigninWebService()
        mockSigninFormModelValidator = MockSigninModelValidator()
        mockSigninViewDelegate = MockSigninViewDelegate()
        sut = SigninPresenter(signinFormModelValidator: mockSigninFormModelValidator, signinWebService: mockSigninWebService, signinViewDelegate: mockSigninViewDelegate)
    }

    override func tearDownWithError() throws {
        
        signinFormModel = nil
        mockSigninWebService = nil
        mockSigninFormModelValidator = nil
        sut = nil
    }

    func testSignInPresenter_WhenInfoProvided_ThePresenterShouldValidateEachProperty() {
                
        // When
        sut.processUserSignin(withFormModel:signinFormModel)
        
        // Then
        XCTAssertTrue(mockSigninFormModelValidator.isEmailValid, "The email should be valid but it was not.")
        XCTAssertTrue(mockSigninFormModelValidator.isPasswordValid, "The password should be valid but it was not.")
        
    }
    
    func testSigninPresenter_WhenValidInputIsGiven_ShouldCallSigninMethod() {
        
        
        // When
        sut.processUserSignin(withFormModel:signinFormModel)
        
        // Then
        XCTAssertTrue(mockSigninWebService.isSigninMethodCalled, "The signin() was not called.")
        
    }
    
    func testSigninPresenter_WhenSigninOperationIsSuccessful_ShouldCallSuccessOnViewDelegate() {
        
        // given
        let myExpectation = expectation(description: "Expected success method to be called")

        mockSigninViewDelegate.expectation = myExpectation
        sut.processUserSignin(withFormModel:signinFormModel)

        // when
        self.wait(for: [myExpectation], timeout: 4)
                
    }
}
