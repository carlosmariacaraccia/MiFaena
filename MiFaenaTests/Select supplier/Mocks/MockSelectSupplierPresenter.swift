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
    
    required init(selectSupplierWebService: SelectSupplierWebServiceProtocol, selectSupplierViewDelegate: SelectSupplierViewDelegateProtocol) {
        
    }
    
    func fetchSuppliers() {
        isFetchSuppliersCalled = true
    }
    
    
}
