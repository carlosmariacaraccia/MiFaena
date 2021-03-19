//
//  SigninFormModelValidatorTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import XCTest
@testable import MiFaena

class SigninFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSigninFormModelValidator_WhenEmailIsProvided_ShouldReturnTrue () {
        let sut = SigninFormModelValidator()
        XCTAssertTrue(sut.isEmailValid(email:"clarinmiente"),"The isEmailValid() should be true if a non nil string was given, but it returned false.")
    }
    
    func testSigninFormValidator_WhenPasswordInProvided_ShouldReturnTrue() {
        let sut = SigninFormModelValidator()
        XCTAssertTrue(sut.isPasswordValid(password:"dalaiLama"), "The isPasswordValid() should have returned true is a valid password was give, but it returned false")
    }
    
    
}
