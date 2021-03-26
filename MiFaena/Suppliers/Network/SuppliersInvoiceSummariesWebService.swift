//
//  SuppliersInvoiceSummariesWebService.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation
import Firebase


class SupsInvsSumsWebService:SuppliersInvoiceSummariesWebServiceProtocol {
    
    private let databaseReference: DatabaseReference
    
    required init(databaseReference: DatabaseReference) {
        self.databaseReference = databaseReference
    }
    
    /// Function that gets and array of  the suppliers invoice summaries from firebase.
    /// - Parameter completionHandler: The suppliersInvoicesSummaries array that will be returned.
    /// - Returns: Void.
    func getSuppliersInvoiceSummaries(completionHandler: @escaping (([SuppliersInvSummary]?) -> ())) {
        var invoiceSummaries = [SuppliersInvSummary]()
        self.databaseReference.child("suppliers_invoices_summaries").observe(.childAdded) { (snapshot) in
            let supplierInvSumId = snapshot.key
            self.fetchSupplierInvoiceSummary(invoiceSummaryId: supplierInvSumId) { (supInvSum) in
                invoiceSummaries.append(supInvSum)
                completionHandler(invoiceSummaries)
            }
        }
    }
    
    /// Function that gets the suppliers invoice summaries from firebase.
    /// - Parameters:
    ///   - invoiceSummaryId: The id of the suppliers invoice summary.
    ///   - completionHandler: The invoice summary returned from Firebase.
    /// - Returns: Void.
    func fetchSupplierInvoiceSummary(invoiceSummaryId:String, completionHandler:@escaping(SuppliersInvSummary)->()) {
        self.databaseReference.child("suppliers_invoices_summaries").child(invoiceSummaryId).observeSingleEvent(of: .value) { (snapshot) in
            guard let dict = snapshot.value as? [String:AnyObject] else { return }
            let supplierInvoiceSummary = SuppliersInvSummary(invoiceSummaryId: invoiceSummaryId, dictionary: dict)
            completionHandler(supplierInvoiceSummary!)
        }
    }
}
