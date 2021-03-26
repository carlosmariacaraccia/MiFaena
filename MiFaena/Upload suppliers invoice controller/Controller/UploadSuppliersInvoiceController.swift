//
//  UploadSuppliersInvoiceController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import UIKit

// TODO: Add the navigation controller's items to the bar and to add the cancel button to dismiss the view.
// TODO: Add the a collection view controller to start the process.
// TODO: This all should be done using the MPV design patter because we need to test all the logic because this view controller will proceed with a network call.
// TODO: Add accessibility identifiers to further test this functionality with UITests.

enum UploadSuppliersInvoiceOptions:Int, CaseIterable {
    
    case supplier
    case dates
    case invoiceNumber
    case description
    case items
    case perceptions
    case totals
    
    var description:String {
        switch self {
        case .dates:
            return "FECHAS"
        case .supplier:
            return "PROVEEDOR"
        case .invoiceNumber:
            return "NUMERO DE FACTURA"
        case .description:
            return "DESCRIPCION"
        case .items:
            return "ITEMS"
        case .perceptions:
            return "PERCEPCIONES"
        case .totals:
            return "TOTALES"

        }
    }
}

struct Perception {
    
    var zoneId:String?
    var zoneDescription:String?
    var perceptionAmount:String?
}

struct InvoiceItem {
    
    var productCode:String?
    var itemDescription:String?
    var units:String?
    var unitaryPrice:String?
    var quantity:String?
    var vatRate:String?
    var total:String?
    var accountingAccount:String?
    
}

let UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER = "uploadSuppliersInvoiceReuseIdentifier"


class UploadSuppliersInvoiceController:UICollectionViewController {
    
    
    // MARK:- Properties
    
    
    var supplier:Supplier? { didSet { collectionView.reloadData() } }
    var docDate:Date? { didSet { collectionView.reloadData() } }
    var invoiceDate:Date? { didSet { collectionView.reloadData() } }
    var dueDays:Int? { didSet { collectionView.reloadData() } }
    var salePoint:Int? { didSet { collectionView.reloadData() } }
    var invoiceNumber:Int?
    var invoiceDescription:String?
    var invoiceItems:[InvoiceItem]?
    var perceptions:[Perception]?
    
        
    // MARK:- Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    
    
    // MARK:- Selectors
    
    
    @objc func handleDismisal() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Helpers
    
    
    func configureUI() {
        
        collectionView.backgroundColor = .background
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismisal))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        label.font = UIFont.init(name: "Avenir Next Demi Bold", size: 20)
        label.text = "FACTURA COMPRA"
        label.textColor = UIColor.black.withAlphaComponent(0.60)
        navigationItem.titleView = label
        
        collectionView.register(SuppliersUploadInvoiceGeneralCell.self, forCellWithReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER)

    }
    
}

extension UploadSuppliersInvoiceController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        UploadSuppliersInvoiceOptions.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let supplierInvoiceCellOption = UploadSuppliersInvoiceOptions(rawValue: indexPath.row)

        switch supplierInvoiceCellOption {
        
        case .dates:
            let suppliersInvoiceDatesViewModel = SuppliersInvoiceDatesViewModel(docDate: docDate, invoiceDate: invoiceDate, dueDays: dueDays)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER, for: indexPath) as! SuppliersUploadInvoiceGeneralCell
            cell.attributedString = suppliersInvoiceDatesViewModel.attributedString
            cell.isCorrectlyEntered = suppliersInvoiceDatesViewModel.dataCorrectlyEntered
            return cell
            
        case .supplier:
            let suppliersViewModel = SuppliersSupplierViewModel(supplier: supplier)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER, for: indexPath) as! SuppliersUploadInvoiceGeneralCell
            cell.attributedString = suppliersViewModel.labelsAttributedString
            cell.isCorrectlyEntered = suppliersViewModel.isDataEntered
            return cell
            
        case .description:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER, for: indexPath) as! SuppliersUploadInvoiceGeneralCell
            return cell

        case .perceptions:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER, for: indexPath) as! SuppliersUploadInvoiceGeneralCell
            return cell

        case .invoiceNumber:
            let invoiceNumberViewModel = SuppliersInvoiceNumberViewModel(salesPoint: salePoint, invoiceNumber: invoiceNumber)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER, for: indexPath) as! SuppliersUploadInvoiceGeneralCell
            cell.attributedString = invoiceNumberViewModel.attributedString
            cell.isCorrectlyEntered = invoiceNumberViewModel.isDataEntered
            return cell
            
        case .totals:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER, for: indexPath) as! SuppliersUploadInvoiceGeneralCell
            return cell
            
        case .items:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UPLOAD_SUPPLIERS_INVOICE_GENERAL_CELL_REUSE_IDENTIFIER, for: indexPath) as! SuppliersUploadInvoiceGeneralCell
            return cell
            
        case .none:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "ident", for: indexPath) as UICollectionViewCell
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let option = UploadSuppliersInvoiceOptions(rawValue: indexPath.row)
        
        switch option {
        case .supplier:
            let layout = UICollectionViewFlowLayout()
            let controller = SelectSupplierController(collectionViewLayout: layout)
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
        case .invoiceNumber:
            let invoiceNumberValidationService = SuppliersInvoiceNumberValidator()
            let controller = InputInvoiceNumberViewController(invoiceNumberValidationService: invoiceNumberValidationService)
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
        case .dates:
            let datesValidationService = SuppliersInvoiceDatesValidator()
            let controller = SuppliersInvoiceDatesViewController(suppliersInvoiceDateValidation: datesValidationService)
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
        default:
            print("Default")
        }
        
    }
}

extension UploadSuppliersInvoiceController:SuppliersInvoiceDatesViewControllerDelegate {
    
    func setValues(invoiceDate: Date?, invoiceDocDate: Date?, dueDays: Int?) {
        
        self.invoiceDate = invoiceDate
        self.docDate = invoiceDocDate
        self.dueDays = dueDays
    }
}

extension UploadSuppliersInvoiceController: DidSetInvoiceNumber {
    
    func setInvoiceNumber(salesPoint: Int, invoiceNumber: Int) {
        self.salePoint = salesPoint
        self.invoiceNumber = invoiceNumber
    }
    
}

extension UploadSuppliersInvoiceController:SelectSupplierControllerDelegate {
    
    func didSelectSupplier(supplier: Supplier) {
        self.supplier = supplier
    }
}

extension UploadSuppliersInvoiceController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let options = UploadSuppliersInvoiceOptions(rawValue: indexPath.row)
        
        switch options {
        
        case .supplier:
            
            let supVM = SuppliersSupplierViewModel(supplier: supplier)
            let width = view.frame.width - 24
            let height = supVM.cellHeight(for: width) + 24
            return CGSize(width: width, height: height)
            
        case .dates:
            
            let supVM = SuppliersInvoiceDatesViewModel(docDate: docDate, invoiceDate: invoiceDate, dueDays: dueDays)
            let width = view.frame.width - 24
            let height = supVM.cellHeight(for: width) + 24
            return CGSize(width: width, height: height)

        case .invoiceNumber:
            
            let invoiceViewModel = SuppliersInvoiceNumberViewModel(salesPoint: salePoint, invoiceNumber: invoiceNumber)
            let width = view.frame.width - 24
            let height = invoiceViewModel.cellHeight(for: width) + 24
            return CGSize(width: width, height: height)
            
        case .perceptions:
            fallthrough
        case .description:
            return CGSize(width: view.frame.width - 24, height: 60)
        case .items:
            return CGSize(width: view.frame.width - 24, height: 60)
        case .totals:
            return CGSize(width: view.frame.width - 24, height: 60)
        case .none:
            return CGSize(width: view.frame.width, height: 100)
        
        }
    }
}
