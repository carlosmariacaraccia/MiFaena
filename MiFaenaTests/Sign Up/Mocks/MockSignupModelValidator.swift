//
//  MockSignupModelValidator.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
import UIKit

@testable import MiFaena

class MockSignupModelValidator:SignupModelValidatorProtocol {
    
    var isEmailValid:Bool = false
    var isPasswordValid:Bool = false
    var isUserNameValid:Bool = false
    var isFullNameValid:Bool = false
    var isProfileImageValid:Bool = false
    
    
    func isEmailValid(email: String?) -> Bool {
        isEmailValid = true
        return isEmailValid
    }
    
    func isPasswordValid(password: String?) -> Bool {
        isPasswordValid = true
        return isPasswordValid
    }
    
    func isUserNameValid(userName: String?) -> Bool {
        isUserNameValid = true
        return isUserNameValid
    }
    
    func isFullNameValid(fullName: String?) -> Bool {
        isFullNameValid = true
        return isFullNameValid
    }
    
    func isProfileImageValid(profileImageData: Data?) -> Bool {
        isProfileImageValid = true
        return isProfileImageValid
    }


}
