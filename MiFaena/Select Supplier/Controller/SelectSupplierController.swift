//
//  SelectSupplierController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import UIKit
import Firebase

class SelectSupplierController:UICollectionViewController {

    var presenter:SelectSupplierPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if presenter == nil {
            let dbRef = Database.database().reference()
            let webService = SelectSupplierWebService(databaseReference: dbRef)
            presenter = SelectSupplierPresenter(selectSupplierWebService: webService, selectSupplierViewDelegate: self)
            presenter?.fetchSuppliers()
        } else {
            presenter?.fetchSuppliers()
        }
    }
}

extension SelectSupplierController: SelectSupplierViewDelegateProtocol {
    
    func successfulFetchOfSuppliers(suppliers: [Supplier]) {
        
    }
    
    func errorFetchingSuppliers(error: Error) {
        
    }
    
}
