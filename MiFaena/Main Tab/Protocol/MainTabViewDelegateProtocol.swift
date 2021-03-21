//
//  MainTabViewDelegateProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation

protocol MainTabViewDelegateProtocol:AnyObject {
    
    func successfulUserSignedIn(user: User)
    func unsuccessfulUserSignedIn()
    
}
