//
//  DottedButtonViewModel.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/25/21.
//

import Foundation
import UIKit

struct DottedButtonSheetViewModel {
    
    private let dottedButtonSheetOptions:DottedButtonSheetOptions
    
    init(dottedButtonSheetOptions:DottedButtonSheetOptions) {
        self.dottedButtonSheetOptions = dottedButtonSheetOptions
    }
    
    var descriptions:[String]? {
        switch dottedButtonSheetOptions {
        case .suppliersDottedButton (let suppInvSummary):
            var results = [String]()
            let pay = "PAY \(suppInvSummary.amount) TO \(suppInvSummary.suppliersShortName)".uppercased()
            let remove = "REMOVE \(suppInvSummary.invoiceNumber) FROM \(suppInvSummary.suppliersShortName)".uppercased()
            results.append(pay)
            results.append(remove)
            return results
        }
    }
    
    var images:[UIImage]? {
        switch dottedButtonSheetOptions {
        case .suppliersDottedButton:
            var results = [UIImage]()
            let first = #imageLiteral(resourceName: "dollarReceipt").withRenderingMode(.alwaysTemplate).withTintColor(.meatTradeBlue)
            let second = #imageLiteral(resourceName: "proformaInvoice").withRenderingMode(.alwaysTemplate).withTintColor(.meatTradeRed)
            results.append(first)
            results.append(second)
            return results
        }
    }
    
    // TODO: add a property that returns the height the cell should have to accommodate to the cell's width, so all the text in the label could fit perfectly. 
    // TODO: add an attributed string to format directly the label's text.
    // TODO: change the view model property and return an [UIImageView] formatted as the labels icon should be received.
    
}
