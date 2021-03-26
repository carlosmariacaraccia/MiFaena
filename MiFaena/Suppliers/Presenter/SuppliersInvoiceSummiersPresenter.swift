//
//  SuppliersInvoiceSummiersPresenter.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation


class SuppliersInvoiceSummiersPresenter: SupplierInvoiceSummariesPresenterProtocol {
    
    let supplierInvoiceSummariesWebService: SuppliersInvoiceSummariesWebServiceProtocol
    let supplierInvoiceSummariesViewDelegate: SuppliersInvoiceSummariesViewDelegateProtocol
    
    required init(supplierInvoiceSummariesWebService: SuppliersInvoiceSummariesWebServiceProtocol, supplierInvoiceSummariesViewDelegate: SuppliersInvoiceSummariesViewDelegateProtocol) {
        self.supplierInvoiceSummariesWebService = supplierInvoiceSummariesWebService
        self.supplierInvoiceSummariesViewDelegate = supplierInvoiceSummariesViewDelegate
    }
    
    func processFetchSupplierInvoiceSummaries() {
        
        supplierInvoiceSummariesWebService.getSuppliersInvoiceSummaries { (suppInvSummaries) in
            if let suppInvSummaries = suppInvSummaries {
                self.supplierInvoiceSummariesViewDelegate.successfulRetrieveOfInvSummaries(invoiceSummaries: suppInvSummaries)
            } else {
                let error = NSError(domain: "", code: 01, userInfo: nil)
                self.supplierInvoiceSummariesViewDelegate.unsuccessfulRetrieveOfInvSummaries(error: error)
            }
        }
    }
    
}
