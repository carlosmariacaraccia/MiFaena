//
//  SelectSupplierPresenter.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation


class SelectSupplierPresenter {
    
    let selectSupplierWebService:SelectSupplierWebServiceProtocol
    let selectSupplierViewDelegate:SelectSupplierViewDelegateProtocol
    
    init(selectSupplierWebService:SelectSupplierWebServiceProtocol, selectSupplierViewDelegate:SelectSupplierViewDelegateProtocol) {
        self.selectSupplierWebService = selectSupplierWebService
        self.selectSupplierViewDelegate = selectSupplierViewDelegate
    }
    
    func fetchSuppliers() {
        selectSupplierWebService.fetchSuppliers { suppliers in
            if let suppliers = suppliers {
                self.selectSupplierViewDelegate.successfulFetchOfSuppliers(suppliers: suppliers)
            } else {
                self.selectSupplierViewDelegate.errorFetchingSuppliers(error: NSError(domain: "", code: -1, userInfo: nil))
            }
        }
    }
    
}
