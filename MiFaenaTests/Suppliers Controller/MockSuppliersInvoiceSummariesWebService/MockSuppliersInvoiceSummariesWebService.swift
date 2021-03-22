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
    
    func getSuppliersInvoiceSummaries(completionHandler: @escaping (([SuppliersInvSummary]?) -> ())) {
        
        var supSums = [SuppliersInvSummary]()
        
        let dictionary1 = ["supplierId":"hjalksdhfjasdhf", "suppliersInvoiceId":"asdhfkjhasdf", "suppliersShortname":"Colombo y Magliano SA",  "suppliersMovementId":"asdfasdf", "invoiceType":"A", "invoiceNumber":"1234-4559800", "invoiceDescription":"23 Toros con 16020 kg", "suppliersIconName":"hacienda", "invoiceDate":1429162809359.0, "amount":"123123.45"] as [String:AnyObject]
        
        let dictionary2 = ["supplierId":"Dalai SA", "suppliersInvoiceId":"asdfasdf", "suppliersMovementId":"asdfasdf", "suppliersShortname":"Lalor SA", "invoiceType":"X", "invoiceNumber":"001-4559800", "invoiceDescription":"11 Toros con 6600 kg", "suppliersIconName":"hacienda", "invoiceDate":1429162809359.0, "amount":"123123.45"] as [String:AnyObject]

        
        let dictionary3 = ["supplierId":"Dalai SA", "suppliersInvoiceId":"xxxxx", "suppliersMovementId":"bbbbb", "suppliersShortname":"AJ Mendizabal y Cia", "invoiceType":"A", "invoiceNumber":"0400-2341111", "invoiceDescription":"16 Toros con 9600 kg", "suppliersIconName":"hacienda", "invoiceDate":1429162809359.0, "amount":"123123.45"] as [String:AnyObject]

        
        let dictionary4 = ["supplierId":"Dalai SA", "suppliersInvoiceId":"xxxxx", "suppliersMovementId":"bbbbb", "suppliersShortname":"Ganadera Saliquelo", "invoiceType":"A", "invoiceNumber":"0001-4559800", "invoiceDescription":"11 Toros con 6600 kg", "suppliersIconName":"hacienda", "invoiceDate":1429162809359.0, "amount":"123123.45"] as [String:AnyObject]

        
        let dictionary5 = ["supplierId":"Dalai SA", "suppliersInvoiceId":"xxxxx", "suppliersMovementId":"bbbbb", "suppliersShortname":"Monasterio Tattersal SA", "invoiceType":"A", "invoiceNumber":"0001-4559800", "invoiceDescription":"40 Toros con 24000 kg", "suppliersIconName":"hacienda", "invoiceDate":1429162809359.0, "amount":"123123.45"] as [String:AnyObject]

        let invSum1 = SuppliersInvSummary(invoiceSummaryId: "aksdhfkh234234hklJ", dictionary: dictionary1)
        let invSum2 = SuppliersInvSummary(invoiceSummaryId: "asdflkjasdf", dictionary: dictionary2)
        let invSum3 = SuppliersInvSummary(invoiceSummaryId: "khlaksdhfuasdf", dictionary: dictionary3)
        let invSum4 = SuppliersInvSummary(invoiceSummaryId: "naksmhdfhcalsuh", dictionary: dictionary4)
        let invSum5 = SuppliersInvSummary(invoiceSummaryId: "asdfasdfq3452345", dictionary: dictionary5)

        supSums.append(invSum1!)
        supSums.append(invSum2!)
        supSums.append(invSum3!)
        supSums.append(invSum4!)
        supSums.append(invSum5!)

        fetchIsCalled = true
        completionHandler(supSums)
    }
    
    func fetchSupplierInvoiceSummary(invoiceSummaryId: String, completionHandler: @escaping (SuppliersInvSummary) -> ()) {
        
    }
    
    
}
