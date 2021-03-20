//
//  SignupFirebaseTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/17/21.
//

import XCTest
@testable import MiFaena


class SignupFirebaseTests: XCTestCase {
    
    var bundle:Bundle!
    var image:UIImage!
    var data:Data!
    var signupFormModel:SignupFormModel!


    override func setUpWithError() throws {
       
        bundle = Bundle.init(for: SignupFirebaseTests.self)
        image = UIImage(named: "genericImage.jpeg", in: bundle, with: nil)
        data = image!.jpegData(compressionQuality: 0.3)
        signupFormModel = SignupFormModel(email:"Damian@test.com", password:"asldkjfal;sjdasdf", userName:"Tincho", fullName: "Martin Camo", profileImageData:data!)
    
    }

    override func tearDownWithError() throws {
        
        bundle = nil
        image = nil
        data = nil
        signupFormModel = nil
        
    }

    func testSignupWebService_WhenGivenSuccessfulResponse_SuccessCompletionHandler() {
        // Given
        
        let sut = MockSignupWebService()

        let expectation = self.expectation(description: "Signup web service result expectation")
        sut.loginResult = .success(())

        sut.signup(withForm: signupFormModel) { result in
            switch result {
            case .failure(let error):
                XCTFail("A successful result error should be our expected result, but we got an error with a localized description of \(error.localizedDescription).")
            case .success(_):
                expectation.fulfill()
            }

        }
        
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testSignupWebService_GivenRealData_SuccessCompletionHandler() {
        
        let sut = SignupWebService()
        
        let expectation = self.expectation(description: "Signup web service result expectation")

        sut.signup(withForm: signupFormModel) {
            switch $0 {
            case .failure(let error):
                XCTFail("A successful result error should be our expected result, but we got an error with the message \(error.localizedDescription).")
            case .success(_):
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 10)
    }
    
}
