//
//  SignupPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/17/21.
//

import XCTest
@testable import MiFaena


class SignupPresenterTests: XCTestCase {
    
    private var bundle:Bundle!
    private var image:UIImage!
    private var data:Data!
    private var signupFormModel:SignupFormModel!
    private var mockSignupModelValidator:MockSignupModelValidator!
    private var mockSignupWebService:MockSignupWebService!
    private var sut:SignupPresenter!
    private var mockSignupViewDelegate:MockSignupViewDelegate!

    override func setUpWithError() throws {
        
        bundle = Bundle.init(for: SignupPresenterTests.self)
        image = UIImage(named: "genericImage.jpeg", in: bundle, with: nil)
        data = image!.jpegData(compressionQuality: 0.3)
        signupFormModel = SignupFormModel(email:"clering@test.com", password:"asldkjfal;sjdasdf", userName:"Tincho",
                                          fullName: "Martin Camo", profileImageData:data!)
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        mockSignupModelValidator = MockSignupModelValidator()
        sut = SignupPresenter(signupModelValidator: mockSignupModelValidator, webService: mockSignupWebService, viewDelegate:mockSignupViewDelegate)
        
    }
    
    
    override func tearDownWithError() throws {
        
        bundle = nil
        image = nil
        data = nil
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        // Given
        
        // When

        sut.processUserSignup(formModel: signupFormModel)
        
        // Then
        XCTAssertTrue(mockSignupModelValidator.isEmailValid, "A valid email was not provided")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValid, "A valid password was not provided")
        XCTAssertTrue(mockSignupModelValidator.isFullNameValid, "A valid full name was not provided")
        XCTAssertTrue(mockSignupModelValidator.isUserNameValid, "A valid user name was not provided")
        XCTAssertTrue(mockSignupModelValidator.isProfileImageValid, "A valid profile image was not provided")

    }
    
    
    func testSignupPresenter_WhenValidFormIsGiven_SignupIsCalled() {
        
        // Given
        
        // When
        sut.processUserSignup(formModel: signupFormModel)
        
        // Then
        XCTAssertTrue(mockSignupWebService.isSignupWebServiceCalled, "The signup() was not called in the SignupWebService class.")
    }
    
    func testSignupPresenter_WhenSignupOperationSucceeds_ShouldCallSuccessMethodOnTheDelegate() {
        
        // Given
        let myExpectation = expectation(description: "A successfulSignup() is called")
        mockSignupWebService.loginResult = .success(())
        mockSignupViewDelegate.successExpectation = myExpectation
        
        // When
        sut.processUserSignup(formModel: signupFormModel)
        
        self.wait(for: [myExpectation], timeout: 10)
        
        // Then
    }
    
    func testSignupPresenter_WhenSignupOperationFails_ViewDelegateCallsErrorHandler() {
        
        let myExpectation = expectation(description: "A errorHandler() method should be called.")
        mockSignupWebService.loginResult = .failure(NSError(domain: "", code: -1, userInfo: nil))
        mockSignupViewDelegate.failingExpectation = myExpectation
        
        sut.processUserSignup(formModel: signupFormModel)
        
        self.wait(for: [myExpectation], timeout: 5)
    }


}
