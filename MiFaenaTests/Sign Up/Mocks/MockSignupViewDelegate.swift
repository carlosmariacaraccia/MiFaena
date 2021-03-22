//
//  MockSignupViewDelegate.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/18/21.
//

import Foundation
import XCTest
@testable import MiFaena

class MockSignupViewDelegate:SignupViewDelegateProtocol {
    
    var successExpectation:XCTestExpectation?
    var failingExpectation:XCTestExpectation?
    
    func successfulSignup() {
        successExpectation?.fulfill()
    }
    
    func errorHandler(error: Error) {
        // Don't full fill the expectation. Instead I should call an Error Method
        failingExpectation?.fulfill()
        print(error)
    }
    

    
}
