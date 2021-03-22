//
//  SigninWebServiceTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import XCTest
@testable import MiFaena


class SigninWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSigninWebService_WhenGivenASuccessFullResponse_ReturnsSuccess() {
        
        let sut = SigninWebService()
        
        let signinFormModel = SigninFormModel(email: "test@test.com", password: "clarinmiente")
        
        let myExpectation = expectation(description: "We receive a success response from the completion handler ")
        
        sut.signin(withFormModel: signinFormModel) { response in
            
            switch response {
            case .failure(let error):
                XCTFail("A fail error message of \(error.localizedDescription) occurred when looking for a success")
            case .success(()):
                myExpectation.fulfill()
            }
        }
        
        wait(for: [myExpectation], timeout: 3)
        
    }
    
}
