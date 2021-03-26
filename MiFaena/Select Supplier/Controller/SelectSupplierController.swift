//
//  SelectSupplierController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import UIKit
import Firebase

protocol SelectSupplierControllerDelegate:class {
    func didSelectSupplier(supplier:Supplier)
}


class SelectSupplierController:UICollectionViewController {

    var presenter:SelectSupplierPresenterProtocol?
    
    var suppliers = [Supplier]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var filteredSuppliers = [Supplier]()
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty:Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering:Bool {
        !isSearchBarEmpty && searchController.isActive
    }
    
    weak var delegate:SelectSupplierControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSearchController()

        if presenter == nil {
            let dbRef = Database.database().reference()
            let webService = SelectSupplierWebService(databaseReference: dbRef)
            presenter = SelectSupplierPresenter(selectSupplierWebService: webService, selectSupplierViewDelegate: self)
            presenter?.fetchSuppliers()
        } else {
            presenter?.fetchSuppliers()
        }
    }
    
    // MARK:- Helpers
    
    
    func configureUI(){
        
        collectionView.backgroundColor = .background
        collectionView.register(SelectSupplierCell.self, forCellWithReuseIdentifier: ReusableIdentifiers.selectSupplier)
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar proveedor / CUIT"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    
    private func filterSuppliersForSearchText(_ searchText:String) {
        filteredSuppliers = suppliers.filter { $0.shortName.lowercased().contains(searchText.lowercased()) || $0.taxId.lowercased().contains(searchText.lowercased())}
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredSuppliers.count
        } else {
            return suppliers.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableIdentifiers.selectSupplier, for: indexPath) as! SelectSupplierCell
        if isFiltering {
            cell.selectSupplierViewModel = SelectSupplierViewModel(supplier: filteredSuppliers[indexPath.row], filteredString: searchController.searchBar.text)
            return cell
        } else {
            cell.selectSupplierViewModel = SelectSupplierViewModel(supplier: suppliers[indexPath.row])
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isFiltering {
            let supplier = filteredSuppliers[indexPath.row]
            delegate?.didSelectSupplier(supplier: supplier)
            navigationController?.popViewController(animated: true)
        } else {
            let supplier = suppliers[indexPath.row]
            delegate?.didSelectSupplier(supplier: supplier)
            navigationController?.popViewController(animated: true)
        }
    }

}

extension SelectSupplierController: SelectSupplierViewDelegateProtocol {
    
    func successfulFetchOfSuppliers(suppliers: [Supplier]) {
        self.suppliers = suppliers
    }
    
    func errorFetchingSuppliers(error: Error) {
        
    }
    
}

extension SelectSupplierController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let supplier = suppliers[indexPath.row]
        let viewModel = SelectSupplierViewModel(supplier: supplier)
        let width = view.frame.width - 24
        let height = viewModel.cellHeight(for: width)
        
        return CGSize(width:width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10.0, left: 0, bottom: -10.0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(15)
    }
    
}

extension SelectSupplierController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterSuppliersForSearchText(searchBar.text!)
    }
}

