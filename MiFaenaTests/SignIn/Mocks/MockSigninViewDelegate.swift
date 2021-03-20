//
//  MockSigninViewDelegate.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation
import XCTest
@testable import MiFaena

class MockSigninViewDelegate:SigninViewDelegateProtocol {
    
    var expectation:XCTestExpectation?

    
    func successfulSignin() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: Error) {
        
    }

}
