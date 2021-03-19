//
//  SignupModelValidatorProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
import UIKit

protocol SignupModelValidatorProtocol {
    
    func isEmailValid(email:String?) -> Bool
    func isPasswordValid(password:String?) -> Bool
    func isUserNameValid(userName:String?) -> Bool
    func isFullNameValid(fullName:String?) -> Bool
    func isProfileImageValid(profileImageData:Data?) -> Bool
    
}
