//
//  SigninPresenterProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation

protocol SigninPresenterProtocol:AnyObject {
    
    init(signinFormModelValidator:SigninFormModelValidatorProtocol, signinWebService:SigninWebServiceProtocol, signinViewDelegate:SigninViewDelegateProtocol)
    
    func processUserSignin(withFormModel formModel:SigninFormModel)
    
}
