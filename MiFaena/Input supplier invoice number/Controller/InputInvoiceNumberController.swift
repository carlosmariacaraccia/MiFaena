//
//  InputInvoiceNumberController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import UIKit


protocol DidSetInvoiceNumber:class {
    func setInvoiceNumber(salesPoint:Int, invoiceNumber:Int)
}

class InputInvoiceNumberViewController:UIViewController {
    
    
    // MARK:- Properties

    var pointOfSaleInt:Int?
    var invoiceNumberInt:Int?
    
    weak var delegate:DidSetInvoiceNumber?
    
    private lazy var pointOfSaleTextField:UITextField = {
        let textField1 = UITextField()
        textField1.font = UIFont(name: "Avenir Next Regular", size: 45)
        textField1.textColor = UIColor.black.withAlphaComponent(0.7)
        textField1.keyboardType = .numberPad
        textField1.addTarget(self, action: #selector(checkForPointOfSaleInput), for: .editingChanged)
        return textField1
    }()
    
    private lazy var invoiceNumberTextField:UITextField = {
        let textField1 = UITextField()
        textField1.font = UIFont(name: "Avenir Next Regular", size: 45)
        textField1.textColor = UIColor.black.withAlphaComponent(0.7)
        textField1.keyboardType = .numberPad
        textField1.addTarget(self, action: #selector(checkForInvoiceInput), for: .editingChanged)
        return textField1
    }()

    private lazy var okInvoiceButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.backgroundColor = UIColor.meatTradeBlue.withAlphaComponent(0.6)
        button.isEnabled = false
        button.addTarget(self, action: #selector(tapOkButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()

    
    private let invoiceNumberValidationService:SuppliersInvoiceNumberValidator
    
    
    // MARK:- Lifecycle
    
    init(invoiceNumberValidationService:SuppliersInvoiceNumberValidator) {
        self.invoiceNumberValidationService = invoiceNumberValidationService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(pointOfSaleTextField)
        stackView.addArrangedSubview(invoiceNumberTextField)
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.centerX(inView: view)
        stackView.centerY(inView: view)
        
        view.addSubview(okInvoiceButton)
        okInvoiceButton.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 36, paddingRight: 36, height: 40)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pointOfSaleTextField.becomeFirstResponder()
    }
    
    
    // MARK:- Helpers
    
    
    @objc func checkForPointOfSaleInput() {
        if let pointOfSaleString = pointOfSaleTextField.text {
            if pointOfSaleString.count >= 4 {
                do {
                    let value = try invoiceNumberValidationService.validatePointOfSale(pointOfSale: pointOfSaleString)
                    pointOfSaleInt = Int(value)!
                } catch let error {
                    // display error Message and don't move to the next textfield
                    print(error.localizedDescription)
                    //TODO: Add an alert controller to display the errors to the user
                    pointOfSaleTextField.text = ""
                    return
                }
                pointOfSaleTextField.resignFirstResponder()
                invoiceNumberTextField.becomeFirstResponder()
            }
        }
    }
    
    @objc func checkForInvoiceInput() {
        if let invoiceNumberString = invoiceNumberTextField.text {
            if invoiceNumberString.count == 8 {
                do {
                    let value = try invoiceNumberValidationService.validateInvoiceNumber(invoiceNumber: invoiceNumberString)
                    invoiceNumberInt = Int(value)!
                    okInvoiceButton.isEnabled = true
                } catch let error {
                    // display the error message and don't move to the next item
                    print(error.localizedDescription)
                    //TODO: Add an alert controller to display the errors of the user
                    invoiceNumberTextField.text = ""
                    return
                }
                invoiceNumberTextField.resignFirstResponder()
            }
        }
    }
    
    @objc func tapOkButton() {
        if let pointOfSale = pointOfSaleInt, let invoiceNumber = invoiceNumberInt {
            delegate?.setInvoiceNumber(salesPoint: pointOfSale, invoiceNumber: invoiceNumber)
            navigationController?.popViewController(animated: true)
        }
        return
    }
}


// TODO: Add an Utils.inputcontainer view to show the text field with a line beneath it.
// TODO: Implement a presenter architechture to remove the logic from the view controller and test it.

