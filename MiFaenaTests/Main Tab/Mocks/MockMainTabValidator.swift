//
//  MockMainTabValidator.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation
@testable import MiFaena

class MockMainTabValidator:MainTabValidatorProtocol {
    
    var userIsLoggedIn:Bool = false
    
    func isUserSignedIn() -> String? {
        userIsLoggedIn = true
        return "61eucxcF6HaylMBStyhwqAF8Sah1"
    }
    
    
    
}
