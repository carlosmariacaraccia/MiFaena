//
//  SuppliersInvoiceSummariesWebService.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation


class SuppliersInvoiceSummariesWebService: SuppliersInvoiceSummariesWebServiceProtocol {

    
    /// Function that gets the suppliers invoice summaries from firebase
    /// - Parameter completionHandler: An array with the supplier invoices summaries
    /// - Returns: Void.
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
    
    /// Fuction that gets one supplier invoice summary from Firebase by inputting its id.
    /// - Parameters:
    ///   - invoiceSummaryId: The id of the suppliers invoice summary.
    ///   - completionHandler: The invoice summary returned from Firebase.
    /// - Returns: Void.
    func fetchSupplierInvoiceSummary(invoiceSummaryId:String, completionHandler:@escaping(SuppliersInvSummary)->()) {
        REF_SUPPLIERS_INV_SUMMARIES.observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String:AnyObject] else { return }
            let supplierInvoiceSummary = SuppliersInvSummary(invoiceSummaryId: invoiceSummaryId, dictionary: dictionary)
            completionHandler(supplierInvoiceSummary!)
        }
    }
}
