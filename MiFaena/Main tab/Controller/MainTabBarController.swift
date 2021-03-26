//
//  MainTabController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/21/21.
//

import UIKit
import Firebase

class MainTabBarController:UITabBarController {
    
    var mainTabBarControllerPresenter: MainTabBarControllerPresenterProtocol?
    
    var user:User? {
        didSet {
            guard let navCon = viewControllers?[0] as? UINavigationController else { return }
            guard let suppliersVC = navCon.viewControllers.first as? SuppliersController else { return }
            suppliersVC.user = user
        }
    }
    
    lazy var actionButton:UIButton = {
        let button = UIButton(type: .system)
        let buttonImage = UIImage(named: "actionButtonAddReceipt")
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleActionButtonTap), for: .touchUpInside)
        button.backgroundColor = .meatTradeBlue
        button.layer.shadowRadius = 3
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = 0.5
        button.layer.masksToBounds = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if mainTabBarControllerPresenter == nil {
            let webService = MainTabWebService()
            let validator = MainTabValidator()
            mainTabBarControllerPresenter = MainTabPresenter(mainTabValidator: validator, mainTabWebService: webService, delegate: self)
            mainTabBarControllerPresenter?.processIsUserSignedIn()
        }
    }
    
    

    
    // MARK: - SELECTORS
    
    
    @objc func handleActionButtonTap() {
        let suppliersInvoiceController = SuppliersInvoiceController()
        let navCon = UINavigationController(rootViewController: suppliersInvoiceController)
        navCon.modalPresentationStyle = .fullScreen
        present(navCon, animated: true, completion: nil)
    }
}


extension MainTabBarController:MainTabViewDelegateProtocol {
    
    func successfulUserSignedIn(user: User) {
        configureViewControllers()
        configureUI()
        self.user = user
    }
    
    func unsuccessfulUserSignedIn() {
        // Go to the sign in view controller
        DispatchQueue.main.async {
            let navCon = UINavigationController(rootViewController: SigninViewController())
            navCon.modalPresentationStyle = .fullScreen
            self.present(navCon, animated: true, completion: nil)
        }
    }
    
    // MARK:- Helpers

    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 120, paddingRight: 16, width: 64, height: 64)
        actionButton.layer.cornerRadius = 56 / 2
    }

    
    func configureViewControllers() {
        let suppliersLayout = UICollectionViewFlowLayout()
        let suppliersController = SuppliersController(collectionViewLayout: suppliersLayout)
        let customersController = CustomersController()
        let productionController = ProductionController()
        let resultsController = ResultsController()
        let miscellaneousController = MiscellaneousController()
        
        viewControllers = [(suppliersController, "outMoney", "Suppliers"), (customersController, "inMoney", "Customers"), (productionController, "manufacturing", "Production"), (resultsController, "results", "Results"), (miscellaneousController, "group", "Misc")].map {embedInNavCon(tupleOfInput: $0 as! (inputViewController: UIViewController, imageName: String, itemTitle: String))}
    }
    
    private func embedInNavCon(tupleOfInput:(inputViewController: UIViewController, imageName: String, itemTitle: String)) ->  UINavigationController {
        let navCon = UINavigationController(rootViewController: tupleOfInput.inputViewController)
        navCon.tabBarItem.image = UIImage(named: tupleOfInput.imageName)
        navCon.tabBarItem.title = tupleOfInput.itemTitle
        
        return navCon
    }
}
