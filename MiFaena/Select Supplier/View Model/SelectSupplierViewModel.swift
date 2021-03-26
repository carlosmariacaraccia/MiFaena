//
//  SelectSupplierViewModel.swift
//  MeatTrade
//
//  Created by Carlos Caraccia on 2/27/21.
//

import Foundation
import UIKit

struct SelectSupplierViewModel {
    
    private let supplier:Supplier
    var filteredString:String?
    
    init(supplier:Supplier, filteredString:String? = nil) {
        self.supplier = supplier
        self.filteredString = filteredString
    }
    
    
    var attributedString:NSAttributedString {
        var shortName = supplier.shortName
        shortName = shortName + "\n"
        let cuit = supplier.taxId
        let shortNameAttributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Regular", size: 15)!, .foregroundColor: UIColor.black.withAlphaComponent(0.8)]
        let cuitAttributes:[NSAttributedString.Key:Any] = [.font:UIFont(name: "Avenir Next Regular", size: 15)!, .foregroundColor:UIColor.black.withAlphaComponent(0.6)]
        let mutableString = NSMutableAttributedString(string: shortName, attributes: shortNameAttributes)
        let attr = NSAttributedString(string: cuit, attributes: cuitAttributes)
        mutableString.append(attr)
        if let filteredString = filteredString?.lowercased(), let stringToSearchIn = mutableString.string.lowercased() as NSString? {
            let shortNameRange = stringToSearchIn.range(of: filteredString, options: .regularExpression, range: NSMakeRange(0, stringToSearchIn.length))
            let cuitRange = stringToSearchIn.range(of: filteredString, options: .regularExpression, range: NSMakeRange(0, stringToSearchIn.length))
            mutableString.addAttribute(.backgroundColor, value: UIColor.red.withAlphaComponent(0.4), range: shortNameRange)
            mutableString.addAttribute(.backgroundColor, value: UIColor.red.withAlphaComponent(0.4), range: cuitRange)
            print(mutableString.string)
            return mutableString
        } else {
            return mutableString
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
