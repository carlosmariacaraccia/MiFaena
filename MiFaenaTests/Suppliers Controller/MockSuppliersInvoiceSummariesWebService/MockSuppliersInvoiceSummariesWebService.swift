//
//  MockSuppliersInvoiceSummariesWebService.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation
@testable import MiFaena

class MockSuppliersInvoiceSummariesWebService: SuppliersInvoiceSummariesWebServiceProtocol {
    
    var fetchIsCalled:Bool = false
    
//    supplierId
//    suppliersInvoiceId
//    suppliersMovementId
//    invoiceType
//    invoiceNumber
//    invoiceDescription
//    suppliersIconName
//    invoiceDate
//    amount

    
    func getSuppliersInvoiceSummaries(completionHandler: @escaping (([SuppliersInvSummary]?) -> ())) {
        var supSums = [SuppliersInvSummary]()
        let dictionary = ["supplierId":"Dalai SA", "suppliersInvoiceId":"xxxxx", "suppliersMovementId":"bbbbb", "invoiceType":"X", "invoiceNumber":"xxx-xxxxxxxxx", "invoiceDescription":"23 Toros con 16020 kg", "suppliersIconName":"hacienda", "invoiceDate":1429162809359.0, "amount":"123123.45"] as [String:AnyObject]
        let invSum = SuppliersInvSummary(invoiceSummaryId: "xxx", dictionary: dictionary)
        supSums.append(invSum!)
        fetchIsCalled = true
        completionHandler(supSums)
    }
    
    func fetchSupplierInvoiceSummary(invoiceSummaryId: String, completionHandler: @escaping (SuppliersInvSummary) -> ()) {
        
    }
    
    
}
