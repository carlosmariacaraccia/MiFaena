//
//  InvoiceNumberValidator.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation

struct SuppliersInvoiceNumberValidator {
    
    func validatePointOfSale(pointOfSale:String?) throws ->  String {
        guard let pointOfSale = pointOfSale else { throw SuppliersInvoiceNumberValidationError.invalidValue }
        //reduce the error to see if all the items are 0
        let filteredZeros = pointOfSale.filter { $0 != "0"}
        if filteredZeros.count == 0 {
            throw SuppliersInvoiceNumberValidationError.invalidPointOfSale
        } else {
            return pointOfSale
        }
    }
    
    func validateInvoiceNumber(invoiceNumber:String?) throws -> String {
        guard let invoiceNumber = invoiceNumber else { throw SuppliersInvoiceNumberValidationError.invalidValue }
        let filteredZeros = invoiceNumber.filter { $0 != "0"}
        if filteredZeros.count == 0 {
            throw SuppliersInvoiceNumberValidationError.invalidInvoiceNumber
        } else {
            return invoiceNumber
        }
    }
}
