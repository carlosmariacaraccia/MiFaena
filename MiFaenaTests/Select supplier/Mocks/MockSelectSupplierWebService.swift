//
//  MockSelectSupplierWebService.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation
import Firebase

@testable import MiFaena

class MockSelectSupplierWebService:SelectSupplierWebServiceProtocol {
    
    var isFetchSuppliersCalled:Bool = false
    var dictionary:[String:AnyObject]?
    
    required init(databaseReference: DatabaseReference) {
        
    }
    
    func fetchSuppliers(completionHandler: @escaping (([Supplier]?) -> ())) {
        isFetchSuppliersCalled = true
        if dictionary != nil {
            let supplier = Supplier(supplierId: "alk;sjdfkla;djsf", dictionary: dictionary!)
            if let supplier = supplier {
                var suppliers = [Supplier]()
                suppliers.append(supplier)
                completionHandler(suppliers)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func fetchSupplier(withId id: String, completionHandler: @escaping ((Supplier?) -> ())) {
        
    }
    
    
}
