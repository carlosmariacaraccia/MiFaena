//
//  SignupViewControllerTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/18/21.
//

import XCTest
@testable import MiFaena

class SignupViewControllerTests: XCTestCase {
    
    private var sut:SignupViewController!

    override func setUpWithError() throws {

        sut = SignupViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {

        sut = nil
    }

    func testSignupViewController_WhenCreated_HasRequiredUIElements() {
              
        XCTAssertEqual(sut.secureTextField.text, "", "The email text field should be empty")
    }
    
    func testSignUPViewController_WhenCreated_HasSignupButtonAction() throws {
        
        
        let signupButton = try XCTUnwrap(sut.registerButton, "The button was nit")
        
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "The signup button was nil")
        XCTAssertEqual(signupButtonActions.count, 1, "The amount of actions assigned to the signup button was not 1")
        XCTAssertEqual(signupButtonActions.first, "handleRegistration", "The name of the action assigned to the button was not handleRegistration")
    }
    
    func testSignupViewController_WhenRegistrationButtonIsTapped_InvokesSignupProcess() {
        
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(signupModelValidator: mockSignupModelValidator, webService: mockSignupWebService, viewDelegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        sut.registerButton.sendActions(for: .touchUpInside)
        
       XCTAssertTrue(mockSignupPresenter.didCallProcessUserSignup)
    }
}
