//
//  SignupFormModelValidator.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
import UIKit

class SignupFormModelValidator:SignupModelValidatorProtocol {

    func isEmailValid(email:String?) -> Bool {
        return email != nil
    }
    
    func isPasswordValid(password:String?) -> Bool {
        return password != nil
    }
    
    func isUserNameValid(userName:String?) -> Bool {
        return userName != nil
    }
    
    func isFullNameValid(fullName:String?) -> Bool {
        return fullName != nil
    }
    
    func isProfileImageValid(profileImage:UIImage?) -> Bool {
        return profileImage != nil
    }
}
