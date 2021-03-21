//
//  Utils.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/18/21.
//

import UIKit

class Utilities {
    
    /// Creates a custom alert controller
    /// - Parameters:
    ///   - title: the title of the alert controller
    ///   - message: the message of the alert controller
    ///   - accessibilityIdent: the accessibility identifier that the alert controller has, useful for uitests
    /// - Returns: the desired uialertcontroller
   static func createAlertControllerWithMessage(title:String, message:String, accessibilityIdent:String) -> UIAlertController {
        
        let alertController = UIAlertController()
        alertController.title = title
        alertController.message = message
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        alertController.view.accessibilityIdentifier = accessibilityIdent
        return alertController
        
    }

    
    /// Function that creates a textfield with a divider and places a small image in front of the text field
    /// - Parameters:
    ///   - imageView: the image view that will be placed in front of the text field
    ///   - textfield: the text field that will register the input
    /// - Returns: the resulting uivew
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

