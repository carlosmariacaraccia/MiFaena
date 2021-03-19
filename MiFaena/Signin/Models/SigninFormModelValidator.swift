//
//  SigninFormModelValidator.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation


class SigninFormModelValidator: SigninFormModelValidatorProtocol {
    
    func isEmailValid(email:String?) -> Bool {
        return email != nil
    }
    
    func isPasswordValid(password:String?) -> Bool {
        return password != nil
    }
    
    
}
