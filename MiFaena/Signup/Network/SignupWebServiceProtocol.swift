//
//  SignupWebServiceProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation


protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormModel, completionHandler:@escaping(Result<Void,Error>)->())
    
}
