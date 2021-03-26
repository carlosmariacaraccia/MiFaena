//
//  SelectSupplierWebService.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation
import Firebase


class SelectSupplierWebService:SelectSupplierWebServiceProtocol {
    
    private let databaseReference:DatabaseReference
    
    required init(databaseReference:DatabaseReference) {
        self.databaseReference = databaseReference
    }
    
    /// Function that fetches a array of suppliers from Firebase.
    /// - Parameter completionHandler: The returning array of suppliers from firebase.
    /// - Returns: Void.
    func fetchSuppliers(completionHandler:@escaping(([Supplier]?)->())) {
        var suppliers = [Supplier]()
        self.databaseReference.child("suppliers").observe(.childAdded) { (snapshot) in
            let supplierId = snapshot.key
            self.fetchSupplier(withId: supplierId) { supplier in
                if let supplier = supplier {
                    suppliers.append(supplier)
                    completionHandler(suppliers)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    /// Function that fetches one supplier from firebase give its id.
    /// - Parameters:
    ///   - id: a string containing the id of the supplier.
    ///   - completionHandler: the resulting Supplier if found.
    /// - Returns: Void.
    func fetchSupplier(withId id:String, completionHandler:@escaping((Supplier?)->())) {
        self.databaseReference.child("suppliers").child(id).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String:AnyObject] else { return }
            if let supplier = Supplier(supplierId: id, dictionary: dictionary) {
                completionHandler(supplier)
            } else {
                completionHandler(nil)
            }
        }
    }
}
