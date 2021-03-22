//
//  MainTabBarControllerPresenterProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation


protocol MainTabBarControllerPresenterProtocol:AnyObject {
    
    init(mainTabValidator:MainTabValidatorProtocol, mainTabWebService:MainTabWebServiceProtocol, delegate:MainTabViewDelegateProtocol)
    
    func processIsUserSignedIn()
    
}
