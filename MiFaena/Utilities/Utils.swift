//
//  Utils.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/18/21.
//

import UIKit

class Utilities {
    
    static func createAlertController(forErrorMessage error: Error) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Action", style: .default, handler: nil)
        alert.addAction(okAction)
        return alert
    }
    
    static func inputContainerView(withImageView imageView:UIImageView, textfield: UITextField) -> UIView {
        
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(imageView)
        imageView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        imageView.setDimensions(width: 24, height: 24)

        view.addSubview(textfield)
        textfield.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .meatTradeBlue
        view.addSubview(dividerView)
        dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }
    
    static func inputTextField(with placeholder:String) -> UITextField {
        
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = .meatTradeBlue
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor:UIColor.meatTradeBlue])
        return textField

    }
    
    static func attributedButton(_ firstPart:String, _ secondPart:String) -> UIButton {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: firstPart,
                            attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                         NSAttributedString.Key.foregroundColor : UIColor.meatTradeRed])
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.meatTradeBlue]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
    
}

