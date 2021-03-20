//
//  MockSigninPresenter.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation
@testable import MiFaena

class MockSigninPresenter:SigninPresenterProtocol {
    
    var processUserSigninCalled:Bool = false
    
    required init(signinFormModelValidator: SigninFormModelValidatorProtocol, signinWebService: SigninWebServiceProtocol, signinViewDelegate: SigninViewDelegateProtocol) {
        
    }
    
    func processUserSignin(withFormModel formModel: SigninFormModel) {
        processUserSigninCalled = true
    }
    
    
}
