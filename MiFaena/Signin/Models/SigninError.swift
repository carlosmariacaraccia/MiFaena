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
    
    
    var errorDescription: String? {
        switch self {
        case .emptyEmail(let description):
            return description
        case .emptyPassword(let password):
            return password
        case .invalidRequest( let request):
            return request
        }
    }
}

