//
//  SigninViewController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/19/21.
//

import UIKit

class SigninViewController:UIViewController {

    private var spinnerViewController:SpinnerViewController?
    
    var signinPresenter:SigninPresenterProtocol?
    
    lazy var meatTradeLogo:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "meatTradeSvg")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    

    lazy var emailContainerView:UIView = {
        var image = #imageLiteral(resourceName: "securedLetter").withRenderingMode(.alwaysTemplate)
        let iv = UIImageView(image: image)
        iv.tintColor = .meatTradeRed
        let view = Utilities.inputContainerView(withImageView: iv, textfield: emailTextField)
        return view
    }()
    
    lazy var passwordContainerView:UIView = {
        var image = UIImage(named: "lock")!.withRenderingMode(.alwaysTemplate)
        let iv = UIImageView(image: image)
        iv.tintColor = .meatTradeRed
        let view = Utilities.inputContainerView(withImageView: iv, textfield: passwordTextField)
        return view
    }()
    
    let emailTextField = Utilities.inputTextField(with: "Email")
    let passwordTextField = Utilities.inputTextField(with: "Password")
    
    lazy var signinButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.meatTradeRed, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.borderColor = UIColor.meatTradeBlue.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var createAccountButton:UIButton = {
        let button = Utilities.attributedButton("Don't have account", " Sign up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        passwordTextField.isSecureTextEntry = true
        
        view.addSubview(meatTradeLogo)
        meatTradeLogo.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 50)
        meatTradeLogo.setDimensions(width: 300, height: 121)
        
        // create a stack view for the text fields
        let stackView:UIStackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, signinButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        
        view.addSubview(stackView)
        stackView.anchor(top: meatTradeLogo.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(createAccountButton)
        createAccountButton.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        
        if signinPresenter == nil {
            let signinFormModelValidator = SigninFormModelValidator()
            let signinWebService = SigninWebService()
            signinPresenter = SigninPresenter(signinFormModelValidator: signinFormModelValidator, signinWebService: signinWebService, signinViewDelegate: self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
    
    func addSpinnerViewController() {
        if spinnerViewController == nil {
            spinnerViewController = SpinnerViewController()
            addChild(spinnerViewController!)
            spinnerViewController!.view.frame = view.frame
            view.addSubview(spinnerViewController!.view)
            spinnerViewController!.didMove(toParent: self)
        }
    }


    @objc func handleLogin() {
        addSpinnerViewController()
        let form = SigninFormModel(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        signinPresenter?.processUserSignin(withFormModel: form)
    }
    
    @objc func handleShowSignUp() {
        let registration = SignupViewController()
        navigationController?.pushViewController(registration, animated: true)
    }

}


extension SigninViewController: SigninViewDelegateProtocol {
    func successfulSignin() {
        // Handle success
        if self.spinnerViewController != nil {
            self.spinnerViewController!.willMove(toParent: nil)
            self.spinnerViewController!.view.removeFromSuperview()
            self.spinnerViewController!.removeFromParent()
        }
    }
    
    func errorHandler(error: Error) {

        let alertController = Utilities.createAlertControllerWithMessage(title: "Error", message: error.localizedDescription, accessibilityIdent: "signupErrorAlertDialog")
        //We are in a background queue so we have to go to the main thread
        DispatchQueue.main.async {
            self.present(alertController, animated: true) {
                if self.spinnerViewController != nil {
                    self.spinnerViewController!.willMove(toParent: nil)
                    self.spinnerViewController!.view.removeFromSuperview()
                    self.spinnerViewController!.removeFromParent()
                }
                // return the form to its initial state
                self.emailTextField.text = nil
                self.passwordTextField.text = nil
            }
        }
    }
}
