//
//  MockSelectSupplierPresenter.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation
@testable import MiFaena


class MockSelectSupplierPresenter:SelectSupplierPresenterProtocol {
    
    var isFetchSuppliersCalled:Bool = false
    var retrievedSuppliers:[Supplier]?
    
    let webService: SelectSupplierWebServiceProtocol
    let viewDelegate: SelectSupplierViewDelegateProtocol
        
    required init(selectSupplierWebService: SelectSupplierWebServiceProtocol, selectSupplierViewDelegate: SelectSupplierViewDelegateProtocol) {
        
        self.webService = selectSupplierWebService
        self.viewDelegate = selectSupplierViewDelegate
    }
    
    func fetchSuppliers() {
        isFetchSuppliersCalled = true
        
        if let suppliers = retrievedSuppliers {
            
            viewDelegate.successfulFetchOfSuppliers(suppliers: suppliers)
        }
    }
    
    
}
