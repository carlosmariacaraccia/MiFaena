//
//  SignupPresenterProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/18/21.
//

import Foundation

protocol SignupPresenterProtocol:AnyObject {
    
    init(signupModelValidator:SignupModelValidatorProtocol, webService:SignupWebServiceProtocol, viewDelegate:SignupViewDelegateProtocol)
    
    func processUserSignup(formModel form:SignupFormModel)
    
}
