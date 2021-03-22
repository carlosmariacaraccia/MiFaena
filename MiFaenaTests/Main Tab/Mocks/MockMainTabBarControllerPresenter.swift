//
//  MockMainTabBarControllerPresenter.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation
@testable import MiFaena

class MockMainTabBarControllerPresenter: MainTabBarControllerPresenterProtocol {
    
    var processCheckIfUserIsSignedInIsCalled:Bool = false
 
    
    required init(mainTabValidator: MainTabValidatorProtocol, mainTabWebService: MainTabWebServiceProtocol, delegate: MainTabViewDelegateProtocol) {
        
    }
    
    func processIsUserSignedIn() {
        processCheckIfUserIsSignedInIsCalled = true
    }
    
    
    
}
