//
//  SuppliersInvoiceDatesValidator.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation

struct SuppliersInvoiceDatesValidator {
    
    func validateDates(invoiceDate:Date?, docDate:Date?) throws ->  (invoiceDate:Date, docDate:Date) {
        if let invoiceDate = invoiceDate, let docDate = docDate {
            if docDate < invoiceDate {
                throw SuppliersInvoiceDateError.invalidDocDate
            } else {
                return (invoiceDate:invoiceDate, docDate: docDate)
            }
        } else {
            throw SuppliersInvoiceDateError.invalidDates
        }
    }
}
