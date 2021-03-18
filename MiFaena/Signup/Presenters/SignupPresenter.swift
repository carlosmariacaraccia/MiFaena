//
//  SignupPresenter.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
import UIKit


class SignupPresenter {
    
    private var signupModelValidator:SignupModelValidatorProtocol
    private var webServiceProtocol:SignupWebServiceProtocol
    private weak var viewDelegate:SignupViewDelegateProtocol?
    
    init(signupModelValidator:SignupModelValidatorProtocol, webService:SignupWebServiceProtocol, viewDelegate:SignupViewDelegateProtocol? = nil) {
        self.signupModelValidator = signupModelValidator
        self.webServiceProtocol = webService
        self.viewDelegate = viewDelegate
    }
    
    func processUserSignup(formModel form:SignupFormModel) {
        if !signupModelValidator.isEmailValid(email: form.email) {
            return
        }
        
        if !signupModelValidator.isPasswordValid(password: form.password) {
            return
        }
        
        if !signupModelValidator.isFullNameValid(fullName: form.fullName) {
            return
        }
        
        if !signupModelValidator.isUserNameValid(userName: form.userName) {
            return
        }
        
        if !signupModelValidator.isProfileImageValid(profileImage: UIImage(data: form.profileImageData)) {
            return
        }
        
        webServiceProtocol.signup(withForm: form) { [weak self] (result) in
            // TODO: Impelent the success of fail delegate method
            switch result {
            case .success(()):
                self?.viewDelegate?.successfulSignup()
            case .failure(let error):
                self?.viewDelegate?.errorHandler(error: error)
            }
        }

    }
    
}
