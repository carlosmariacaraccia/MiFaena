//
//  DottedButtonsSheet.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/24/21.
//

import UIKit
 

class DottedButtonSheet:NSObject {
    
    private let options:DottedButtonSheetOptions
    private let tableView = UITableView()
    private var window:UIWindow?
    private lazy var viewModel = DottedButtonSheetViewModel(dottedButtonSheetOptions: options)
    
    private lazy var backgroundView:UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var cancelButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.meatTradeRed, for: .normal)
        button.backgroundColor = .systemGroupedBackground
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    private lazy var footerView:UIView = {
        let view = UIView()
        view.addSubview(cancelButton)
        cancelButton.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)
        cancelButton.centerY(inView: view)
        cancelButton.layer.cornerRadius = 25
        return view
    }()


    init(options:DottedButtonSheetOptions) {
        self.options = options
        super.init()
        configureTableView()
    }
    
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.backgroundView.alpha = 0
            self.tableView.frame.origin.y += 300
        }
    }
    
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 10
        tableView.isScrollEnabled = false
        tableView.register(DottedButtonSheetCell.self, forCellReuseIdentifier: ReusableIdentifiers.dottedButtonReuseIdentifier)
    }
    
    func show() {
        
        guard let x = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) else { return }
        self.window = x
        window!.addSubview(backgroundView)
        backgroundView.frame = window!.frame
        backgroundView.isUserInteractionEnabled = true
        
        window!.addSubview(tableView)
        if let cellsQuantity = viewModel.descriptions?.count {
            let height = CGFloat(cellsQuantity * 60) + 100
            tableView.frame = CGRect(x: 0, y: window!.frame.height, width: window!.frame.width, height: height)
            // show the added view
            UIView.animate(withDuration:0.5) {
                self.backgroundView.alpha = 1
                self.tableView.frame.origin.y -= height
            }
        }
    }
}


extension DottedButtonSheet: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let times = viewModel.descriptions?.count else { return 0 }
        return times
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let possibleCell  = tableView.dequeueReusableCell(withIdentifier: ReusableIdentifiers.dottedButtonReuseIdentifier, for: indexPath) as? DottedButtonSheetCell
        guard let cell = possibleCell else { return UITableViewCell() }
        cell.cellLabel.text = viewModel.descriptions![indexPath.row]
        cell.imView.image = viewModel.images![indexPath.row]
        return cell
    }
}

extension DottedButtonSheet: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        60
    }
}


