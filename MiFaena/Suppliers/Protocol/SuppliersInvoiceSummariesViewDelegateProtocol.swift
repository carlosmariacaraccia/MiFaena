//
//  SuppliersInvoiceSummariesViewDelegateProtocol.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation


protocol SuppliersInvoiceSummariesViewDelegateProtocol:AnyObject {
    
    func successfulRetrieveOfInvSummaries(invoiceSummaries:[SuppliersInvSummary])
    func unsuccessfulRetrieveOfInvSummaries(error:Error)
    
}
