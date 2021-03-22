//
//  SuppliersInvSummaries.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation


struct SuppliersInvSummary {
    
    let invoiceSummaryId:String
    let supplierId:String
    let suppliersInvoiceId:String
    let suppliersMovementId:String
    let invoiceType:String
    let invoiceNumber:String
    let invoiceDate:Date
    let invoiceDescription:String
    let suppliersIconName:String
    let amount:Decimal
    
    init?(invoiceSummaryId:String, dictionary:[String:AnyObject]) {
        
        guard let supplierId = dictionary["supplierId"] as? String else { return nil }
        guard let suppliersInvoiceId = dictionary["suppliersInvoiceId"] as? String else { return nil }
        guard let suppliersMovementId = dictionary["suppliersMovementId"] as? String else { return nil }
        guard let invoiceType = dictionary["invoiceType"] as? String else { return nil }
        guard let invoiceNumber = dictionary["invoiceNumber"] as? String else { return  nil }
        guard let invoiceDescription = dictionary["invoiceDescription"] as? String else { return nil }
        guard let suppliersIconName = dictionary["suppliersIconName"] as? String else { return nil }
        guard let invoiceDate = dictionary["invoiceDate"] as? Double else { return nil }
        guard let amount = dictionary["amount"] as? String else { return nil }
        
        
        self.invoiceSummaryId = invoiceSummaryId
        self.supplierId = supplierId
        self.suppliersInvoiceId = suppliersInvoiceId
        self.suppliersMovementId = suppliersMovementId
        self.invoiceType = invoiceType
        self.invoiceNumber = invoiceNumber
        self.suppliersIconName = suppliersIconName
        self.invoiceDescription = invoiceDescription
        self.invoiceDate = Date(timeIntervalSince1970: invoiceDate)
        if let amount = Decimal(string: amount) {
            self.amount = amount
        } else {
            return nil
        }
    }
}
