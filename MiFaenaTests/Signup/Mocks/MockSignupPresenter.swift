//
//  MockSignupPresenter.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/18/21.
//

import Foundation
@testable import MiFaena

class MockSignupPresenter: SignupPresenterProtocol {
    
    var didCallProcessUserSignup:Bool = false
    
    required init(signupModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, viewDelegate: SignupViewDelegateProtocol) {
    }
    
    func processUserSignup(formModel form: SignupFormModel) {
        didCallProcessUserSignup = true
    }
}
