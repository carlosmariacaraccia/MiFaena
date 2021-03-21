//
//  MainTabPresenter.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/20/21.
//

import Foundation

class MainTabPresenter {
    
    private var mainTabValidator:MainTabValidatorProtocol
    private var mainTabWebServie:MainTabWebServiceProtocol
    private weak var delegate:MainTabViewDelegateProtocol?
    
    init(mainTabValidator:MainTabValidatorProtocol, mainTabWebService:MainTabWebServiceProtocol, delegate:MainTabViewDelegateProtocol) {
        self.mainTabValidator = mainTabValidator
        self.mainTabWebServie = mainTabWebService
        self.delegate = delegate
    }
    
    func processIsUserSignedIn() {
        
        if mainTabValidator.isUserSignedIn() == nil {
            return
        }
        
        mainTabWebServie.fetchUser(withId: mainTabValidator.isUserSignedIn()!) { [weak self] (user) in
            if let user = user {
                self?.delegate?.successfulUserSignedIn(user: user)
            } else {
                self?.delegate?.unsuccessfulUserSignedIn()
            }
        }
    }
}
