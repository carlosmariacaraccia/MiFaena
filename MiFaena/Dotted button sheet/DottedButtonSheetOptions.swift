//
//  DottedButtonSheetOptions.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/25/21.
//

import Foundation

enum DottedButtonSheetOptions {
    
    case suppliersDottedButton (suppInvSummary: SuppliersInvSummary)
    
    var objectPassed:AnyObject? {
        switch self {
        case .suppliersDottedButton(suppInvSummary: let  suppInvSummary):
            return suppInvSummary as AnyObject
        }
    }
}
