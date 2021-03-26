//
//  SuppliersInvoiceDatesController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import UIKit

protocol SuppliersInvoiceDatesViewControllerDelegate:class {
    func setValues(invoiceDate:Date?, invoiceDocDate:Date?, dueDays:Int?)
}



class SuppliersInvoiceDatesViewController:UIViewController {
    
    
    // MARK:- Properties
    
    
    private let suppliersInvoiceDateValidation:SuppliersInvoiceDatesValidator
    
    weak var delegate:SuppliersInvoiceDatesViewControllerDelegate?
        var plazoDePago:Int? {
        Int(segmentedControlDueDays[dueDaysSegmentedControl.selectedSegmentIndex])
    }
    let segmentedControlDueDays = ["0", "7", "15", "21", "30", "60", "90", "180"]
    
    init(suppliersInvoiceDateValidation: SuppliersInvoiceDatesValidator) {
        self.suppliersInvoiceDateValidation = suppliersInvoiceDateValidation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var invoiceDateTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Avenir Next Demi Bold", size: 20)
        label.numberOfLines = 0
        label.text = "Fecha de factura"
        return label
    }()
    
    private lazy var fechaDeFacturaPicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    private lazy var invoiceDateDocumentalLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Avenir Next Demi Bold", size: 20)
        label.numberOfLines = 0
        label.text = "Fecha documental"
        return label
    }()
    
    private lazy var fechaDocumentalPicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    private lazy var dueDaysLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Avenir Next Demi Bold", size: 20)
        label.numberOfLines = 0
        label.text = "Plazo de pago"
        return label
    }()
    
    private lazy var dueDaysSegmentedControl:UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: segmentedControlDueDays)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var doneButton:UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(pushDoneButton), for: .touchUpInside)
        button.backgroundColor = UIColor.meatTradeBlue.withAlphaComponent(0.5)
        let titleAttributes:[NSAttributedString.Key:Any] = [.font: UIFont(name: "Avenir Next Regular", size: 20)!]
        let title = NSAttributedString(string: "DONE", attributes: titleAttributes)
        button.setAttributedTitle(title, for: .normal)
        button.setDimensions(width: 200, height: 50)
        button.layer.cornerRadius = 5
        return button
    }()

    
    
    
    // MARK:- Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let stackView1 = UIStackView(arrangedSubviews: [invoiceDateTitleLabel, fechaDeFacturaPicker])
        stackView1.axis = .horizontal
        stackView1.spacing = 4
        stackView1.alignment = .center
        stackView1.distribution = .equalCentering
        
        let stackView2 = UIStackView(arrangedSubviews: [invoiceDateDocumentalLabel, fechaDocumentalPicker])
        stackView2.axis = .horizontal
        stackView2.spacing = 4
        stackView2.distribution = .equalCentering
        
        let finalStackView = UIStackView(arrangedSubviews: [stackView1, stackView2, dueDaysLabel, dueDaysSegmentedControl, doneButton])
        finalStackView.axis = .vertical
        finalStackView.spacing = 24
        finalStackView.alignment = .center
        finalStackView.distribution = .equalSpacing
        
        view.addSubview(finalStackView)
        finalStackView.centerX(inView: view)
        finalStackView.centerY(inView: view)
    }
    
    @objc func pushDoneButton() {
        // validate the input
        do {
            let result = try suppliersInvoiceDateValidation.validateDates(invoiceDate: fechaDeFacturaPicker.date, docDate: fechaDocumentalPicker.date)
            delegate?.setValues(invoiceDate: result.invoiceDate, invoiceDocDate: result.docDate, dueDays: plazoDePago)
            navigationController?.popViewController(animated: true)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
    }
    
    
}


