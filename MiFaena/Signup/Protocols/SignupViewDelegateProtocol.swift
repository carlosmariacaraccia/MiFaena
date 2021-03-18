//
//  SignupViewDelegateProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/18/21.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {

    
    func successfulSignup()
    func errorHandler(error:Error)
    
    
}

