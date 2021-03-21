//
//  MockMainTabWebService.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import Foundation
@testable import MiFaena

class MockMainTabWebService: MainTabWebServiceProtocol{
    
    var isFetchUserCalled:Bool = false
    
    func fetchUser(withId uid: String, completionHandler: @escaping (User?) -> ()) {
        let dictionary = ["fullName":"Dalai Lama", "userName":"Max", "email":"dalai@dalai.com", "profileImageUrl":"http://DelDalai.com/"] as [String:AnyObject]
        let user = User(uid: "asdfdf", dictionary: dictionary)
        isFetchUserCalled = true
        completionHandler(user)
    }
    
}
