//
//  MockSuppliersInvoiceSummariesWebService.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation
@testable import MiFaena
import Firebase


class MockSuppliersInvoiceSummariesWebService:SuppliersInvoiceSummariesWebServiceProtocol {
    
    var fetchIsCalled:Bool = false
    
    required init(databaseReference: DatabaseReference) {
        
    }
    
    func getSuppliersInvoiceSummaries(completionHandler: @escaping (([SuppliersInvSummary]?) -> ())) {
        
        fetchIsCalled = true
        let dictionary = ["supplierId":"hjalksdhfjasdhf", "suppliersInvoiceId":"asdhfkjhasdf", "suppliersShortname":"Colombo y Magliano SA",  "suppliersMovementId":"asdfasdf", "invoiceType":"A", "invoiceNumber":"1234-4559800", "invoiceDescription":"23 Toros con 16020 kg", "suppliersIconName":"hacienda", "invoiceDate":1577847600.0, "amount":"123123.45"] as [String:AnyObject]
        let suppliersInvoiceSummary = SuppliersInvSummary(invoiceSummaryId: "234234", dictionary: dictionary)
        completionHandler([suppliersInvoiceSummary!])
    }
    
    func fetchSupplierInvoiceSummary(invoiceSummaryId: String, completionHandler: @escaping (SuppliersInvSummary) -> ()) {
        
    }
    
    
}
