//
//  DottedButtonSheetCell.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/25/21.
//

import UIKit

class DottedButtonSheetCell:UITableViewCell {
    
    // MARK:- Properties
    
    
    lazy var imView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var cellLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some text"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(imView)
        imView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12, constant: 0)
        imView.setDimensions(width: 36, height: 36)
        
        addSubview(cellLabel)
        cellLabel.centerY(inView: self, leftAnchor: imView.rightAnchor, paddingLeft: 8, constant: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
