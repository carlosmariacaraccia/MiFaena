//
//  DottedButtonsSheet.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/24/21.
//

import UIKit


enum DottedButtonSheetOptions {
    
    case suppliersDottedButton (suppInvSummary: SuppliersInvSummary)
    
    var objectPassed:AnyObject? {
        switch self {
        case .suppliersDottedButton(suppInvSummary: let  suppInvSummary):
            return suppInvSummary as AnyObject
        }
    }
}

class DottedButtonSheet:NSObject {
    
    private let options:DottedButtonSheetOptions
    private let tableView = UITableView()
    private var window:UIWindow?
    
    private lazy var bb:UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissal))
        view.addGestureRecognizer(tap)
        return view
    }()

    init(options:DottedButtonSheetOptions) {
        self.options = options
        super.init()
        configureTableView()
    }
    
    
    @objc func handleDismissal() {
        UIView.animate(withDuration: 0.5) {
            self.bb.alpha = 0
            self.tableView.frame.origin.y += 300
        }
    }
    
    func configureTableView() {
        tableView.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 10
        tableView.isScrollEnabled = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ReusableIdentifiers.dottedButtonReuseIdentifier)
    }
    
    func show() {
        //guard let wind = UIApplication.shared.windows.first else { return }
        guard let x = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) else { return }
        self.window = x

        window!.addSubview(bb)
        bb.frame = window!.frame
        bb.isUserInteractionEnabled = true
        
        
        //guard let suppInvSummaryPassed = options.objectPassed as? SuppliersInvSummary else { return }
        window!.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: window!.frame.height, width: window!.frame.width, height: 300)
        tableView.isUserInteractionEnabled = true
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .allowUserInteraction) {
            self.bb.alpha = 1
            self.tableView.frame.origin.y -= 300
            self.bb.isUserInteractionEnabled = true
            self.window?.isUserInteractionEnabled = true
        }
    }
    
    @objc func handleTap() {
        print("tapped")
    }
}

extension SuppliersController {
    
}


extension DottedButtonSheet: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableIdentifiers.dottedButtonReuseIdentifier, for: indexPath)
        return cell
    }
}

extension DottedButtonSheet: UITableViewDelegate {
    
}


