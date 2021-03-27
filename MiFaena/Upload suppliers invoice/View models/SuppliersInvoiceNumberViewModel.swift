//
//  SuppliersInvoiceNumberViewModel.swift
//  MeatTrade
//
//  Created by Carlos Caraccia on 3/3/21.
//

import UIKit

struct SuppliersInvoiceNumberViewModel {
    
    private var salesPoint:Int?
    private var invoiceNumber:Int?
    
    init(salesPoint:Int?, invoiceNumber:Int?) {
        self.salesPoint = salesPoint
        self.invoiceNumber = invoiceNumber
    }
    
    var isDataEntered:Bool {
        if salesPoint != nil && invoiceNumber != nil {
            return true
        } else {
            return false
        }
    }

    
    var attributedString:NSAttributedString {
        
        if let salesPoint = salesPoint, let invoiceNumber = invoiceNumber {
            let  invoiceNum = "\(salesPoint)" + "-" + "\(invoiceNumber)"
            let invoiceNumAttributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Regular", size: 14)!, .foregroundColor:UIColor.black.withAlphaComponent(0.6)]
            let attributedString = NSAttributedString(string: invoiceNum, attributes: invoiceNumAttributes)
            let titleAttributes:[NSAttributedString.Key:Any] = [.font: UIFont(name: "Avenir Next Demi Bold", size: 14)!, .foregroundColor:UIColor.black.withAlphaComponent(0.8)]
            let titleString = "NUMERO DE FACTURA" + "\n"
            let mutableString = NSMutableAttributedString(string: titleString, attributes: titleAttributes)
            mutableString.append(attributedString)
            return mutableString
        } else {
            let attributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Demi Bold", size: 16)!, .foregroundColor: UIColor.black.withAlphaComponent(0.8)]
            let attributedString = NSAttributedString(string: "NUMERO DE FACTURA", attributes: attributes)
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
