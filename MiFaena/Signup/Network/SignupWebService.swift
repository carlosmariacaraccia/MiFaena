//
//  SignupWebService.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
import Firebase


class SignupWebService:SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormModel, completionHandler:@escaping(Result<Void,Error>)->()) {
        Auth.auth().createUser(withEmail: formModel.email, password: formModel.password) { (authDataResult, createUserError) in
            if let authResult = authDataResult {
                let fileName = UUID().uuidString
                STORAGE_PROFILE_IMAGES.child(fileName).putData(formModel.profileImageData!, metadata: nil) { _ , storageError in
                    if storageError == nil {
                        STORAGE_PROFILE_IMAGES.child(fileName).downloadURL { (url, urlError) in
                            if let profileImageUrlString = url?.absoluteString {
                                // now I can create my user dict and store its value in Firebase as a registered user
                                let userValues = ["email":formModel.email, "userName":formModel.userName, "fullName":formModel.fullName, "profileImageUrl":profileImageUrlString]
                                REF_USERS.child(authResult.user.uid).updateChildValues(userValues) { (error, _) in
                                    if let saveUserError = error {
                                        completionHandler(.failure(saveUserError))
                                    } else {
                                        completionHandler(.success(()))
                                    }
                                }
                            } else {
                                // error in downloading the url
                                completionHandler(.failure(urlError!))
                            }
                        }
                    } else {
                        completionHandler(.failure(storageError!))
                    }
                }
            } else {
                // error in the create user response
                completionHandler(.failure(createUserError!))
            }
        }
    }
}
