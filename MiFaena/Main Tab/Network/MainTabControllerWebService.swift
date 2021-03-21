//
//  MainTabControllerWebService.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/20/21.
//

import Foundation
import Firebase

class MainTabControllerWebService {
    
    func fetchUser(withId uid:String, completionHandler:@escaping(User?)->()) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject] {
                let user = User(uid: uid, dictionary: dictionary)
                completionHandler(user)
            } else {
                completionHandler(nil)
            }
        }
    }
}
