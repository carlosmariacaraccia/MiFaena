//
//  SuppliersInvoiceSummariesWebService.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation


class SuppliersInvoiceSummariesWebService: SuppliersInvoiceSummariesWebServiceProtocol {

    
    func getSuppliersInvoiceSummaries(completionHandler:@escaping(([SuppliersInvSummary]?)->())) {
        var invoiceSummaries = [SuppliersInvSummary]()
        REF_SUPPLIERS_INV_SUMMARIES.observe(.childAdded) { (snapshot) in
            let supplierInvoiceSummaryId = snapshot.key
            self.fetchSupplierInvoiceSummary(invoiceSummaryId: supplierInvoiceSummaryId) { (suppInvSummary) in
                invoiceSummaries.append(suppInvSummary)
                completionHandler(invoiceSummaries)
            }
        }
    }
    
    func fetchSupplierInvoiceSummary(invoiceSummaryId:String, completionHandler:@escaping(SuppliersInvSummary)->()) {
        REF_SUPPLIERS_INV_SUMMARIES.observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String:AnyObject] else { return }
            let supplierInvoiceSummary = SuppliersInvSummary(invoiceSummaryId: invoiceSummaryId, dictionary: dictionary)
            completionHandler(supplierInvoiceSummary!)
        }
    }
}
