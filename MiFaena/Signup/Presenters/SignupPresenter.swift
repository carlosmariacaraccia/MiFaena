//
//  SignupPresenter.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
import UIKit


class SignupPresenter:SignupPresenterProtocol {
    
    private var signupModelValidator:SignupModelValidatorProtocol
    private var webServiceProtocol:SignupWebServiceProtocol
    private weak var viewDelegate:SignupViewDelegateProtocol?
    
    required init(signupModelValidator:SignupModelValidatorProtocol, webService:SignupWebServiceProtocol, viewDelegate:SignupViewDelegateProtocol) {
        
        self.signupModelValidator = signupModelValidator
        self.webServiceProtocol = webService
        self.viewDelegate = viewDelegate
    }
    
    func processUserSignup(formModel form:SignupFormModel) {
        
        
        if !signupModelValidator.isEmailValid(email: form.email) {
            let error = SignUpError.invalidEmail(description: "The email text field must not be empty")
            self.viewDelegate?.errorHandler(error: error)
            return
        }
        
        if !signupModelValidator.isPasswordValid(password: form.password) {
            let error = SignUpError.invalidPassword(description: "The password text field must not be empty")
            self.viewDelegate?.errorHandler(error: error)
            return

        }
        
        if !signupModelValidator.isFullNameValid(fullName: form.fullName) {
            let error = SignUpError.invalidFullName(description: "The full name text field must not be empty")
            self.viewDelegate?.errorHandler(error: error)
            return

        }
        
        if !signupModelValidator.isUserNameValid(userName: form.userName) {
            let error = SignUpError.invalidUserName(description: "The user name text field must not be empty")
            self.viewDelegate?.errorHandler(error: error)
            return

        }
        
        if !signupModelValidator.isProfileImageValid(profileImageData: form.profileImageData) {
            let error = SignUpError.invalidUserProfileImage(description: "A rofile image must be selected")
            self.viewDelegate?.errorHandler(error: error)
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
