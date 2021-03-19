//
//  SigninFormModelValidatorProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation

protocol SigninFormModelValidatorProtocol:AnyObject {
    
    func isEmailValid(email:String?) -> Bool
    func isPasswordValid(password:String?) -> Bool
    
}

