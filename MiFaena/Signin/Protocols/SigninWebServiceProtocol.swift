//
//  SigninWebServiceProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation


protocol SigninWebServiceProtocol:AnyObject {

    func signin(withFormModel formModel:SigninFormModel, completionHandler:@escaping(Result<Void,Error>)->())
    
    
}
