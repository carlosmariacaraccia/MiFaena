//
//  SupplierInvoiceSummariesPresenterProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation


protocol SupplierInvoiceSummariesPresenterProtocol {
    
    
    init(supplierInvoiceSummariesWebService: SuppliersInvoiceSummariesWebServiceProtocol, supplierInvoiceSummariesViewDelegate: SuppliersInvoiceSummariesViewDelegateProtocol)
    
    func processFetchSupplierInvoiceSummaries()
    
}
