//
//  MockSigninModelValidator.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation
@testable import MiFaena


class MockSigninModelValidator:SigninFormModelValidatorProtocol{
    
    var isEmailValid:Bool = false
    var isPasswordValid:Bool = false
    
    func isEmailValid(email: String?) -> Bool {
        isEmailValid = true
        return isEmailValid
    }
    
    func isPasswordValid(password: String?) -> Bool {
        isPasswordValid = true
        return isPasswordValid
    }
    
    
    
}
