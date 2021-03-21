//
//  MainTabWebServiceProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation

protocol MainTabWebServiceProtocol:AnyObject {
    
    func fetchUser(withId uid:String, completionHandler:@escaping(User?)->())
    
}
