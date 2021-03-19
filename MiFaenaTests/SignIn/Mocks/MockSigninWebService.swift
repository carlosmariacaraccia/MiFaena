//
//  MockSigninWebService.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation
@testable import MiFaena

class MockSigninWebService:SigninWebServiceProtocol {
    
    var isSigninMethodCalled:Bool = false

    func signin(withFormModel formModel: SigninFormModel, completionHandler: @escaping (Result<Void, Error>) -> ()) {
        isSigninMethodCalled = true
        completionHandler(.success(()))
    }
    
}
