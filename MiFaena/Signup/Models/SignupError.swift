//
//  SignupError.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import Foundation

enum SignUpError:LocalizedError, Equatable {
    
    case failedRequest(description:String)
    case invalidEmail(description:String)
    case invalidPassword(description:String)
    case invalidFullName(description:String)
    case invalidUserName(description:String)
    case invalidUserProfileImage(description:String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidPassword(let description):
            return description
        case .invalidUserName(let description):
            return description
        case .invalidEmail(let description):
            return description
        case .invalidUserProfileImage(let description):
            return description
        case .invalidFullName(let description):
            return description
        }
    }
}
