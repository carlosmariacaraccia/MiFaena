//
//  SuppliersInvoiceNumberError.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation

enum SuppliersInvoiceNumberValidationError:LocalizedError {
        
    case invalidPointOfSale
    case invalidInvoiceNumber
    case invalidValue
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered and invalid value"
        case .invalidPointOfSale:
            return "El punto de venta no puede ser 0000"
        case .invalidInvoiceNumber:
            return "El numero de facutra no puede ser 00000000"
        }
    }
}
