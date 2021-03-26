//
//  SuppliersController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import UIKit
import Firebase
import SDWebImage


class SuppliersController: UICollectionViewController {
    
    // MARK:- Properties

    var dottedButtonSheet:DottedButtonSheet!
    var user:User? {
        didSet {
            configureLeftBarButton()
            if presenter == nil {
                let webService = SupsInvsSumsWebService(databaseReference: Database.database().reference())
                presenter = SuppliersInvoiceSummiersPresenter(supplierInvoiceSummariesWebService: webService, supplierInvoiceSummariesViewDelegate: self)
                presenter?.processFetchSupplierInvoiceSummaries()
            } else {
                presenter?.processFetchSupplierInvoiceSummaries()
            }
        }
    }
    
    var supplierInvoiceSummaries:[SuppliersInvSummary]? {
        didSet { collectionView.reloadData() }
    }
    var presenter:SupplierInvoiceSummariesPresenterProtocol?

    
    // MARK:- View Controller Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
   }
    
    
    // MARK:- Configure UI
    
    
    func configureUI() {
        collectionView.backgroundColor = .background
        let image = UIImage(named: "meatTradeSvg")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        collectionView.register(InvoiceSummaryCell.self, forCellWithReuseIdentifier: ReusableIdentifiers.suppliersControlller)
        collectionView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        
    }
    
    func configureLeftBarButton() {
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        guard let profileImageUrl = user?.url else { return }
        profileImageView.sd_setImage(with: profileImageUrl)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }

}

extension SuppliersController: SuppliersInvoiceSummariesViewDelegateProtocol {
    
    func successfulRetrieveOfInvSummaries(invoiceSummaries: [SuppliersInvSummary]) {
        self.supplierInvoiceSummaries = invoiceSummaries
    }
    
    func unsuccessfulRetrieveOfInvSummaries(error: Error) {
        
    }
    
}

extension SuppliersController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let invoicesSummaries = supplierInvoiceSummaries else { return 0 }
        return invoicesSummaries.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableIdentifiers.suppliersControlller, for: indexPath) as! InvoiceSummaryCell
        
        // TODO: Add a view model to change the size of the invoice summary description height according to its space  availability to be drawn.
        
        guard let invoicesSummaries = supplierInvoiceSummaries else { return UICollectionViewCell() }
        let invoiceSummary = invoicesSummaries[indexPath.row]
        cell.invoiceSummary = invoiceSummary
        cell.delegate = self
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        cell.layer.shadowOpacity = 0.25
        cell.layer.shadowRadius = 2.0
        return cell
    }
    
    // TODO: Add a the didSelectItem at indexPath to show a detailed view of the suppliers invoice. Also I have to create a new controller it. It will nee to be done with MPV because we will need a Firebase request. It should be tested with unit test and uitest. The idel would be to do it with tdd.
}


extension SuppliersController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 24, height: 150)
    }
}


extension SuppliersController:SuppliersInvoiceCellDelegate {
    func showOptionsSheet(invoiceSummary: SuppliersInvSummary) {
        let dottedButtonsOptions = DottedButtonSheetOptions.suppliersDottedButton(suppInvSummary: invoiceSummary)
        dottedButtonSheet = DottedButtonSheet(options: dottedButtonsOptions)
        dottedButtonSheet.show()
    }
    
}


