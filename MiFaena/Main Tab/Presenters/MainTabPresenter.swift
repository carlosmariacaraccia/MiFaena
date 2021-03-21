//
//  MainTabPresenter.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/20/21.
//

import Foundation

class MainTabPresenter {
    
    private var mainTabValidator:MainTabValidatorProtocol
    
    init(mainTabValidator:MainTabValidatorProtocol) {
        self.mainTabValidator = mainTabValidator
    }
    
    func processIsUserSignedIn() {
        
        if mainTabValidator.isUserSignedIn() == nil {
            return
        }
        
    }
}
