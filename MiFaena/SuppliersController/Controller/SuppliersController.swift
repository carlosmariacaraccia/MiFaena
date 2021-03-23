//
//  SuppliersController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import UIKit
import Firebase

class SuppliersController: UICollectionViewController {
    
    var user:User?
    var supplierInvoiceSummaries:[SuppliersInvSummary]? { didSet { collectionView.reloadData() } }
    var presenter:SupplierInvoiceSummariesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        if presenter == nil {
            let webService = SupsInvsSumsWebService(databaseReference: DatabaseReference())
            presenter = SuppliersInvoiceSummiersPresenter(supplierInvoiceSummariesWebService: webService, supplierInvoiceSummariesViewDelegate: self)
            presenter?.processFetchSupplierInvoiceSummaries()
        }
   }
}

extension SuppliersController: SuppliersInvoiceSummariesViewDelegateProtocol {
    
    func successfulRetrieveOfInvSummaries(invoiceSummaries: [SuppliersInvSummary]) {
        self.supplierInvoiceSummaries = invoiceSummaries
    }
    
    func unsuccessfulRetrieveOfInvSummaries(error: Error) {
        
    }
    
}
