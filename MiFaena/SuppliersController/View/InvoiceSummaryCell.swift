//
//  InvoiceSummaryCell.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/24/21.
//

import Foundation
import UIKit

protocol SuppliersInvoiceCellDelegate:class {
    func showOptionsSheet()
}


class InvoiceSummaryCell:UICollectionViewCell {
    
    // MARK:- Properties
    
    var invoiceSummary:SuppliersInvSummary?
    
    lazy var numberFormatter:NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = "."
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    lazy var formatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    lazy var supplierNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 18)
        label.textColor = UIColor.black.withAlphaComponent(0.65)
        label.text = invoiceSummary?.suppliersShortName ?? "COLOMBO Y MAGLIANO"
        return label
    }()
    
    lazy var dottedButton:UIButton = {
        let button = UIButton(type: .system)
        let buttonImage = #imageLiteral(resourceName: "Invoice Dot Menu")
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(showOptionsSheet), for: .touchUpInside)
        return button
    }()

        
    lazy var firstRowContainerView: UIView = {
        let view = UIView()
        view.addSubview(supplierNameLabel)
        supplierNameLabel.anchor(left: view.leftAnchor, paddingLeft: 0)
        supplierNameLabel.centerY(inView: view)
        view.addSubview(dottedButton)
        dottedButton.anchor(right: view.rightAnchor, paddingRight: 0)
        dottedButton.centerY(inView: view)
        return view
    }()
    
    
    lazy var invoiceNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        let invoiceType = invoiceSummary?.invoiceType ?? "FCA"
        let invoiceNumber = invoiceSummary?.invoiceNumber ?? "1048-41234134"
        let labelText = invoiceType + " " + invoiceNumber
        label.text = labelText
        label.textAlignment = .left
        return label
    }()
    
    lazy var invoiceDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        let invDate = invoiceSummary?.invoiceDate ?? Date()
        label.text = formatter.string(from: invDate)
        label.textAlignment = .right
        return label
    }()
    
    lazy var secondRowContainerView: UIView = {
        let view = UIView()
        view.addSubview(invoiceNumberLabel)
        invoiceNumberLabel.anchor(left: view.leftAnchor, paddingLeft: 0)
        invoiceNumberLabel.centerY(inView: view)
        view.addSubview(invoiceDateLabel)
        invoiceDateLabel.anchor(right: view.rightAnchor, paddingRight: 0)
        invoiceDateLabel.centerY(inView: view)
        return view
    }()
    
    private lazy var invoiceDescriptionIcon:UIImageView = {
        let iv = UIImageView()
        let image = #imageLiteral(resourceName: "cowColor")
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.setDimensions(width: 48, height: 48)
        return iv
    }()
    
    private lazy var invoiceDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black.withAlphaComponent(0.4)
        label.text = invoiceSummary?.invoiceDescription ?? "25 cabezas con 9600 kg."
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var invoiceAmountLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        let invAmount = invoiceSummary?.amount ?? 12345234.45
        label.text = numberFormatter.string(from: NSNumber(nonretainedObject: invAmount)) ?? "$ 12345234.45"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var thirdRowContainerView: UIView = {
        let view = UIView()
        view.addSubview(invoiceDescriptionIcon)
        invoiceDescriptionIcon.anchor(left: view.leftAnchor)
        invoiceDescriptionIcon.centerY(inView: view)
        view.addSubview(invoiceDescriptionLabel)
        invoiceDescriptionLabel.anchor(left: invoiceDescriptionIcon.rightAnchor, paddingLeft: 8)
        invoiceDescriptionLabel.centerY(inView: view)
        view.addSubview(invoiceAmountLabel)
        invoiceAmountLabel.anchor(right: view.rightAnchor,  paddingRight: 0)
        invoiceAmountLabel.centerY(inView: view)
        return view
    }()
    
    weak var delegate:SuppliersInvoiceCellDelegate?


    // MARK:- Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(firstRowContainerView)
        firstRowContainerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingRight: 12, height: 25)
        
        addSubview(secondRowContainerView)
        secondRowContainerView.anchor(top: firstRowContainerView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingRight: 12, height: 25)
        
        addSubview(thirdRowContainerView)
        thirdRowContainerView.anchor(top: secondRowContainerView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK:- Selectors
    
    
    @objc func showOptionsSheet() {
        
        delegate?.showOptionsSheet()
    }

    
}
