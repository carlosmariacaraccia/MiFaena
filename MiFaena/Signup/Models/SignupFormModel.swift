//
//  SignupFormModel.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation

struct SignupFormModel: Encodable {
    
    let email:String
    let password:String
    let userName:String
    let fullName:String
    let profileImageData:Data
    
}
