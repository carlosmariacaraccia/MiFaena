//
//  MockMainTabViewDelegate.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation
import XCTest
@testable import MiFaena

class MockMainTabViewDelegate:MainTabViewDelegateProtocol {
    
    var expectation:XCTestExpectation?
    
    func successfulUserSignedIn(user: User) {
        expectation?.fulfill()
    }
    
    func unsuccessfulUserSignedIn() {
        
    }
    
    
}
