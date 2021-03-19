//
//  SigninPresenter.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation


class SigninPresenter {
    
    private let signinFormModelValidator:SigninFormModelValidatorProtocol
    private let signinWebService:SigninWebServiceProtocol
    private let signinViewDelegate:SigninViewDelegateProtocol
    
    init(signinFormModelValidator:SigninFormModelValidatorProtocol, signinWebService:SigninWebServiceProtocol, signinViewDelegate:SigninViewDelegateProtocol) {
        self.signinFormModelValidator = signinFormModelValidator
        self.signinWebService = signinWebService
        self.signinViewDelegate = signinViewDelegate
    }
    
    func processUserSignin(withFormModel formModel:SigninFormModel) {
        
        if !signinFormModelValidator.isEmailValid(email: formModel.email) {
            let error = SigninError.emptyEmail(description: "Email is empty")
            self.signinViewDelegate.errorHandler(error: error)
        }
        
        if !signinFormModelValidator.isPasswordValid(password: formModel.password) {
            let error = SigninError.emptyPassword(description: "Password is empty")
            self.signinViewDelegate.errorHandler(error: error)

        }
        
        signinWebService.signin(withFormModel: formModel) {[weak self] (result) in
            switch result {
            case .success(()):
                self?.signinViewDelegate.successfulSignin()
            case .failure(let error):
                let signinError = SigninError.invalidRequest(description: error.localizedDescription)
                self?.signinViewDelegate.errorHandler(error: signinError)
            }
        }
    }
    
    
}
