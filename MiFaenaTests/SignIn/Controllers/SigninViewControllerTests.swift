//
//  SigninViewControllerTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import XCTest
@testable import MiFaena


class SigninViewControllerTests: XCTestCase {
    
    var sut:SigninViewController!
    

    override func setUpWithError() throws {
        sut = SigninViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSigninViewController_WhenCreated_HasUITextFieldsEmpty() {
        
        XCTAssertEqual(sut.emailTextField.text, "", "The email text field should be empty but it wasn't.")
        XCTAssertEqual(sut.passwordTextField.text, "", "The email text field should be empty but it wasn't.")
    }
    
    func testSigninViewController_WhenCreated_HasSigninButtonAndAction() throws {
      
        let actions = try XCTUnwrap(sut.signinButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "The button has not actions attached to it.")
        XCTAssertEqual(actions.count, 1, "The button should have one actions assigned to it but it hadn't.")
        XCTAssertTrue(actions.contains("handleLogin"), "The buttons action's name should be handle login but it was not")
    
    }
    
    func testSigninViewController_WhenSigninButtonTapped_InvokesSigninProcess() {
        
        let mockSigninViewDelegate = MockSigninViewDelegate()
        let mockSigninWebService = MockSigninWebService()
        let mockSigninFormModelValidator = MockSigninModelValidator()
        
        let mocksigninPresenter = MockSigninPresenter(signinFormModelValidator: mockSigninFormModelValidator, signinWebService: mockSigninWebService, signinViewDelegate: mockSigninViewDelegate)
        
        sut.signinPresenter = mocksigninPresenter
        
        sut.signinButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(mocksigninPresenter.processUserSigninCalled, "The signinProcess() was not called in the presenter when the sign in button was tapped.")
    }



}
