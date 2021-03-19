//
//  SigninViewDelegateProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation

protocol SigninViewDelegateProtocol:AnyObject {
    
    func successfulSignin()
    func errorHandler(error: SigninError)
    
}
