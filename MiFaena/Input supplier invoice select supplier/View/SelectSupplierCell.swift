//
//  SelectSupplierCell.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import UIKit


class SelectSupplierCell:UICollectionViewCell {
    
    // MARK:- Properties

    
    var selectSupplierViewModel:SelectSupplierViewModel? {
        didSet {
            selectSupplierLabel.attributedText = selectSupplierViewModel?.attributedString
        }
    }
    
    private lazy var selectSupplierLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK:- Initialization and lifecycle

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(selectSupplierLabel)
        selectSupplierLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        selectSupplierLabel.anchor(right: self.rightAnchor, paddingRight: 12)
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

