//
//  SigninError.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation


enum SigninError:LocalizedError, Equatable {
    
    case emptyEmail(description: String)
    case emptyPassword(description: String)
    case invalidRequest(description: String)
    
}

