//
//  SigninWebService.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation
import Firebase

class SigninWebService:SigninWebServiceProtocol {
    
    func signin(withFormModel formModel:SigninFormModel, completionHandler:@escaping(Result<Void,Error>)->()) {
        Auth.auth().signIn(withEmail: formModel.email, password: formModel.password) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(()))
            }
        }
    }
}
