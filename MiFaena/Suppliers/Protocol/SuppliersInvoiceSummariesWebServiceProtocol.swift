//
//  SuppliersInvoiceSummariesWebServiceProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation
import Firebase


protocol SuppliersInvoiceSummariesWebServiceProtocol:AnyObject {
    
    init(databaseReference: DatabaseReference)
    
    func getSuppliersInvoiceSummaries(completionHandler:@escaping(([SuppliersInvSummary]?)->()))
    
    func fetchSupplierInvoiceSummary(invoiceSummaryId:String, completionHandler:@escaping(SuppliersInvSummary)->())
    
}
