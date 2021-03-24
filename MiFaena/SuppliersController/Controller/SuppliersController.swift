//
//  SuppliersController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import UIKit
import Firebase
import SDWebImage

struct ReusableIdentifiers {
    static let suppliersControlller = "suppliersControllerReuseIdentifier"
}

class SuppliersController: UICollectionViewController {
    
    // MARK:- Properties

    
    var user:User? {
        didSet {
            configureLeftBarButton()
            if presenter == nil {
                let webService = SupsInvsSumsWebService(databaseReference: Database.database().reference())
                presenter = SuppliersInvoiceSummiersPresenter(supplierInvoiceSummariesWebService: webService, supplierInvoiceSummariesViewDelegate: self)
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
    
}


extension SuppliersController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 24, height: 150)
    }
}


extension SuppliersController:SuppliersInvoiceCellDelegate {
    func showOptionsSheet() {
        print("DEBUG: Show options sheet")

    }
    
}

