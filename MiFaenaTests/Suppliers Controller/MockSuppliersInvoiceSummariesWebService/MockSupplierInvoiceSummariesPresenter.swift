//
//  MockSupplierInvoiceSummariesPresenter.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation
@testable import MiFaena


class MockSupplierInvoiceSummariesPresenter:SupplierInvoiceSummariesPresenterProtocol {
    
    var processFetchSupInvSumsIsCalled:Bool = false
    
    let mockWS:SuppliersInvoiceSummariesWebServiceProtocol
    let mockDelegate:SuppliersInvoiceSummariesViewDelegateProtocol
    
    required init(supplierInvoiceSummariesWebService: SuppliersInvoiceSummariesWebServiceProtocol, supplierInvoiceSummariesViewDelegate: SuppliersInvoiceSummariesViewDelegateProtocol) {
        self.mockWS = supplierInvoiceSummariesWebService
        self.mockDelegate = supplierInvoiceSummariesViewDelegate
    }
    
    func processFetchSupplierInvoiceSummaries() {
        
        processFetchSupInvSumsIsCalled = true
        
        mockWS.getSuppliersInvoiceSummaries { (invs) in
            self.mockDelegate.successfulRetrieveOfInvSummaries(invoiceSummaries: invs!)
        }
        
    }
    
}
