//
//  MainTabValidator.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation
import Firebase

class MainTabValidator {
    
    func isUserSignedIn() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
}
