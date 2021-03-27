//
//  InputInvoiceitemsCell.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import UIKit

class InputInvoiceItemsCell:UICollectionViewCell {
    
    var inputInvoiceItemViewModel:InputInvoiceItemViewModel?
    
     lazy var itemAmountLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some text"
        return label
    }()

    lazy var itemDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some text"
        return label
    }()

    lazy var itemQueantityPriceLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some text"
        return label
    }()

    lazy var vatRateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some text"
        return label
    }()
    
    lazy var vatAmountLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some text"
        return label
    }()
    
    // TODO:- Add the container views to group the labels

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
}
