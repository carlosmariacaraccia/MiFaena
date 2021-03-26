//
//  SelectSupplierWebServiceProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation
import Firebase

protocol SelectSupplierWebServiceProtocol:AnyObject {
    
    
    init(databaseReference:DatabaseReference)
    
    func fetchSuppliers(completionHandler:@escaping(([Supplier]?)->()))
    
    func fetchSupplier(withId id:String, completionHandler:@escaping((Supplier?)->()))
}
