//
//  SigninFormModelValidator.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation


class SigninFormModelValidator: SigninFormModelValidatorProtocol {
    
    func isEmailValid(email:String?) -> Bool {
        if let email = email {
            if email != "" && email != "Email" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func isPasswordValid(password:String?) -> Bool {
        if let password = password {
            if password != "" && password != "Email" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
