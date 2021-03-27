//
//  SuppliersInvoiceItemsController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import UIKit

class SuppliersInvoiceItemsController: UICollectionViewController {
    
    var invoiceItems = [InvoiceItem]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(InputInvoiceItemsCell.self, forCellWithReuseIdentifier: ReusableIdentifiers.inputInvoiceItems)
    }
}

// MARK:- UICollectionView Datasource
extension SuppliersInvoiceItemsController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return invoiceItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableIdentifiers.inputInvoiceItems, for: indexPath) as? InputInvoiceItemsCell else { return UICollectionViewCell() }
        
        return cell
    }
}

// MARK:- UICollectionView Delegate
extension SuppliersInvoiceItemsController {
    
}


