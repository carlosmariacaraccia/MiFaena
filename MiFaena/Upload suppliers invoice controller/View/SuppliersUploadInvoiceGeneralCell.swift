//
//  SuppliersUploadInvoiceGeneralCell.swift
//  MeatTrade
//
//  Created by Carlos Caraccia on 3/3/21.
//

import UIKit



class SuppliersUploadInvoiceGeneralCell:UICollectionViewCell {
    
    // MARK:- Properties
    
    
    var attributedString:NSAttributedString? {
        didSet {
            guard let attr = attributedString else { return }
            titleLabel.attributedText = attr
        }
    }
    
    var isCorrectlyEntered:Bool? {
        didSet {
            checkMarkImageView.isHidden = !isCorrectlyEntered!
        }
    }
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var checkMarkImageView:UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "checkMark")
        iv.image = image
        iv.tintColor = UIColor.black.withAlphaComponent(0.5)
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    // MARK:- Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK:- Helpers
    
    
    func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = 5
        addSubview(titleLabel)
        titleLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        addSubview(checkMarkImageView)
        checkMarkImageView.centerY(inView: self)
        checkMarkImageView.anchor(left: titleLabel.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 12, width: 20, height: 20)
                
    }
    
    
}
