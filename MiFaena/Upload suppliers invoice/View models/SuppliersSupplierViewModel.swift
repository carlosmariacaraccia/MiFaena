//
//  SuppliersSupplierViewModel.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//


import UIKit


struct SuppliersSupplierViewModel {
    
    var supplier: Supplier?
    
    var isDataEntered:Bool {
        if supplier != nil {
            return true
        } else {
            return false
        }
    }
    
    var labelsAttributedString:NSAttributedString {
        
        if let supplier = supplier {
            var  shortName = supplier.shortName
            shortName = shortName + "\n"
            let cuit = "CUIT: " + supplier.taxId
            let proveedorAttributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Demi Bold", size: 16)!, .foregroundColor:UIColor.black.withAlphaComponent(0.8)]
            
            let shortNameAttributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Demi Bold Italic", size: 14)!, .foregroundColor: UIColor.black.withAlphaComponent(0.6)]
            let cuitAttributes:[NSAttributedString.Key:Any] = [.font: UIFont(name: "Avenir Next Demi Bold Italic", size: 12)!, .foregroundColor:UIColor.black.withAlphaComponent(0.55)]
            let proveedor = "PROVEEDOR" + "\n"
            let mutableString = NSMutableAttributedString(string: proveedor, attributes: proveedorAttributes)
            let attrStr = NSAttributedString(string: shortName, attributes: shortNameAttributes)
            let attr = NSAttributedString(string: cuit, attributes: cuitAttributes)
            mutableString.append(attrStr)
            mutableString.append(attr)
            return mutableString
        } else {
            let attributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Demi Bold", size: 16)!, .foregroundColor: UIColor.black.withAlphaComponent(0.8)]
            let attributedString = NSAttributedString(string: "PROVEEDOR", attributes: attributes)
            return attributedString
        }
    }
    
    func cellHeight(for width:CGFloat) -> CGFloat {
        let label = UILabel()
        label.text = labelsAttributedString.string
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: width).isActive = true
        let size = label.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return size.height

    }
    
}
