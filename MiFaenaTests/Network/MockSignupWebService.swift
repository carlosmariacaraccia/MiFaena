//
//  MockSignupWebService.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
@testable import MiFaena

class MockSignupWebService:SignupWebServiceProtocol {
    
    var loginResult:Result<Void,Error> = .success(())
    var isSignupWebServiceCalled:Bool = false
    
    
    func signup(withForm formModel: SignupFormModel, completionHandler: @escaping (Result<Void, Error>) -> ()) {
        isSignupWebServiceCalled = true
        completionHandler(loginResult)
    }
}


