//
//  User.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/20/21.
//

import Foundation

struct User {
    
    let uid:String
    let userName:String
    let email:String
    let fullName:String
    let url:URL
    
    init?(uid:String, dictionary:[String:AnyObject]) {
        
        guard let userName = dictionary["userName"] as? String else { return nil }
        guard let email = dictionary["email"] as? String else { return nil }
        guard let fullName = dictionary["fullName"] as? String else { return nil }
        guard let stringUrl = dictionary["profileImageUrl"] as? String else { return nil }
        guard let url = URL(string: stringUrl) else { return nil }
        
        self.uid = uid
        self.userName = userName
        self.email = email
        self.fullName = fullName
        self.url = url

    }
}
