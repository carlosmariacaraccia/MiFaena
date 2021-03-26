//
//  SuppliersInvoiceDatesViewModel.swift
//  MeatTrade
//
//  Created by Carlos Caraccia on 3/3/21.
//

import UIKit


struct SuppliersInvoiceDatesViewModel {
    
    var docDate:Date?
    var invoiceDate:Date?
    var dueDays:Int?
    
    var dataCorrectlyEntered:Bool {
        if docDate != nil && invoiceDate != nil && dueDays != nil {
            return true
        } else {
            return false
        }
    }
    
    var attributedString:NSAttributedString {
        if let docDate = docDate, let invoiceDate = invoiceDate, let dueDays = dueDays {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            
            let valuesAttributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Italic", size: 14)!, .foregroundColor:UIColor.black.withAlphaComponent(0.6)]
            
            let titleAttributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Demi Bold", size: 14)!, .foregroundColor:UIColor.black.withAlphaComponent(0.8)]
            
            let docDateTitle = NSAttributedString(string: "FECHA DOCUMENTAL: " + "\n", attributes: titleAttributes)
            
            let docDateString = formatter.string(from: docDate) + "\n"
            let docDateValues = NSAttributedString(string: docDateString, attributes: valuesAttributes)
            
            let invoiceDateTitle = NSAttributedString(string: "FECHA DE FACTURA: " + "\n", attributes: titleAttributes)
            
            let invoiceDateString = formatter.string(from: invoiceDate) + "\n"
            let invoiceDateValues = NSAttributedString(string: invoiceDateString, attributes: valuesAttributes)
            
            let dueDaysTitle = NSAttributedString(string: "PLAZO DE PAGO: " + "\n", attributes: titleAttributes)
            
            let dueDaysValues = NSAttributedString(string: "\(dueDays)", attributes: valuesAttributes)
            
            let mutableString = NSMutableAttributedString()
            mutableString.append(invoiceDateTitle)
            mutableString.append(invoiceDateValues)
            mutableString.append(docDateTitle)
            mutableString.append(docDateValues)
            mutableString.append(dueDaysTitle)
            mutableString.append(dueDaysValues)
            return mutableString
        } else {
            let attributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Demi Bold", size: 16)!, .foregroundColor: UIColor.black.withAlphaComponent(0.8)]
            let attributedString = NSAttributedString(string: "FECHAS DE FACTURA", attributes: attributes)
            return attributedString
        }
    }
    
    func cellHeight(for width:CGFloat) -> CGFloat {
        let label = UILabel()
        label.text = attributedString.string
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: width).isActive = true
        let size = label.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return size.height
    }

}
