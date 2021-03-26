//
//  SuppliersInvoiceDateError.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation


enum SuppliersInvoiceDateError:LocalizedError {
        
    case invalidDocDate
    case invalidDates
    
    var errorDescription: String? {
        switch self {
        case .invalidDocDate:
            return "La fecha documental ser anterior a la fecha de la factura"
        case .invalidDates:
            return "Las fechas son invalidas"
        }
    }
}
