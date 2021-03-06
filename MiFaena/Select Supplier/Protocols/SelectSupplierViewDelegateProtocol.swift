//
//  SelectSupplierViewDelegateProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation


protocol SelectSupplierViewDelegateProtocol:AnyObject {
    
    func successfulFetchOfSuppliers(suppliers: [Supplier])
    func errorFetchingSuppliers(error:Error)
    
}
