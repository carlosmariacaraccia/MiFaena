//
//  SelectSupplierPresenterProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation


protocol SelectSupplierPresenterProtocol:AnyObject {
    
    init(selectSupplierWebService:SelectSupplierWebServiceProtocol, selectSupplierViewDelegate:SelectSupplierViewDelegateProtocol)
    
    func fetchSuppliers()
    
}
