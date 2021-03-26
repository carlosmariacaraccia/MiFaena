//
//  SignupViewController.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/18/21.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    private var imagePicker = UIImagePickerController()
    private var profileImage:UIImage?
    
    var spinnerController:SpinnerViewController?
    var signupPresenter:SignupPresenterProtocol?
    
    
    // small logo on the bottom left
    lazy var meatTradeLogo:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "meatTradeSvg")
        iv.contentMode = .scaleAspectFit
        iv.layer.shadowColor = UIColor.darkGray.cgColor
        iv.layer.shadowRadius = 40
        iv.setDimensions(width: 60, height: 40)
        return iv
    }()
    
    // profile image view
    lazy var addImageImageView:UIImageView = {
        let iv = UIImageView()
        let image = #imageLiteral(resourceName: "meatTradeAddPhoto").withRenderingMode(.alwaysTemplate)
        iv.image = image
        iv.tintColor = .meatTradeRed
        iv.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTouch))
        iv.addGestureRecognizer(tapGesture)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    // email, password, full name, username
    
    lazy var secureTextField = Utilities.inputTextField(with: "Email")
    lazy var passwordTextField = Utilities.inputTextField(with: "Password")
    lazy var fullNameTextField = Utilities.inputTextField(with: "Full Nmae")
    lazy var userNameTextField = Utilities.inputTextField(with: "User Name")
    
    lazy var emailContainerView:UIView = {
        let image = #imageLiteral(resourceName: "securedLetter").withRenderingMode(.alwaysTemplate)
        let iv = UIImageView(image: image)
        iv.tintColor = .meatTradeRed
        let view = Utilities.inputContainerView(withImageView: iv, textfield: secureTextField)
        return view
    }()
    
    lazy var passwordContainerView:UIView = {
        let image = UIImage(named:"lock")!.withRenderingMode(.alwaysTemplate)
        let iv = UIImageView(image: image)
        iv.tintColor = .meatTradeRed
        passwordTextField.isSecureTextEntry = true
        let view = Utilities.inputContainerView(withImageView: iv, textfield: passwordTextField)
        return view
    }()
    
    lazy var fullNameContainerView:UIView = {
        let image = #imageLiteral(resourceName: "userTag").withRenderingMode(.alwaysTemplate)
        let iv = UIImageView(image: image)
        iv.tintColor = .meatTradeRed
        let view = Utilities.inputContainerView(withImageView: iv, textfield: fullNameTextField)
        return view
    }()
    
    lazy var userNameContainerView:UIView = {
        let image = #imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate)
        let iv = UIImageView(image: image)
        iv.tintColor = .meatTradeRed
        let view = Utilities.inputContainerView(withImageView: iv, textfield: userNameTextField)
        return view
    }()
    
    lazy var registerButton:UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.meatTradeRed, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.borderColor = UIColor.meatTradeBlue.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    lazy var loginFormButton:UIButton = {
        let button = Utilities.attributedButton("Already have and account?", " Sign in.")
        button.addTarget(self, action: #selector(handleReturnToLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var bottomContainerView:UIView = {
        let view = UIView()
        
        // add the logo and the login form button
        view.addSubview(meatTradeLogo)
        meatTradeLogo.centerY(inView: view)
        meatTradeLogo.anchor(left: view.leftAnchor, paddingLeft: 4)
        
        // add the return to login button
        view.addSubview(loginFormButton)
        loginFormButton.centerY(inView: view)
        loginFormButton.anchor(left: meatTradeLogo.rightAnchor, right: view.rightAnchor, paddingLeft: 4, paddingRight: 4)
        
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        
        // added image picker delegate
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        // injectSignupPresenter
        if signupPresenter == nil {
            
            let signupFormModelValidator = SignupFormModelValidator()
            let signupWebService = SignupWebService()
            
            signupPresenter = SignupPresenter(signupModelValidator: signupFormModelValidator, webService: signupWebService, viewDelegate: self)
        }
        
    }
    
    
    func configureUI() {
        
        view.addSubview(addImageImageView)
        addImageImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        addImageImageView.anchor(width:150, height: 150)
        
        
        let inputStack:UIStackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullNameContainerView, userNameContainerView, registerButton])
        inputStack.axis = .vertical
        inputStack.spacing = 20
        inputStack.distribution = .fillEqually
        
        view.addSubview(inputStack)
        inputStack.anchor(top: addImageImageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingRight: 8)
        
        view.addSubview(bottomContainerView)
        bottomContainerView.centerX(inView: view)
        bottomContainerView.anchor(bottom: view.bottomAnchor, paddingBottom: 50, height: 55)

    }
    
    
    @objc func handleReturnToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleProfileImageTouch() {
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true)
    }
    
    func makeSpinnerBegginSpinning() {
        if spinnerController == nil {
            spinnerController = SpinnerViewController()
            addChild(spinnerController!)
            spinnerController!.view.frame = view.frame
            view.addSubview(spinnerController!.view)
            spinnerController!.didMove(toParent: self)
        }
    }
    
    
    @objc func handleRegistration() {
        makeSpinnerBegginSpinning()
        let email = secureTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let userName = userNameTextField.text ?? ""
        let fullName = fullNameTextField.text ?? ""
        let imageData = profileImage?.jpegData(compressionQuality: 0.3)
                
        let signupFormModel = SignupFormModel(email: email, password: password, userName: userName,
                                              fullName: fullName, profileImageData: imageData)
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
}

extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // got the image
        guard let image = info[.editedImage] as? UIImage else { return }
        
        // set the image and change the appearence
        addImageImageView.image = image
        
        self.addImageImageView.layer.cornerRadius = 150 / 2
        self.addImageImageView.contentMode = .scaleAspectFill
        self.addImageImageView.clipsToBounds = true
        self.addImageImageView.layer.borderWidth = 3
        self.addImageImageView.layer.masksToBounds = true
        self.addImageImageView.layer.borderColor = UIColor.meatTradeRed.cgColor
        self.profileImage = image
        
        dismiss(animated: true)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfulSignup() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            guard let tab = window.rootViewController as? MainTabBarController else { return }
            tab.mainTabBarControllerPresenter?.processIsUserSignedIn()
            self.spinnerController!.willMove(toParent: nil)
            self.spinnerController!.view.removeFromSuperview()
            self.spinnerController!.removeFromParent()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func errorHandler(error: Error) {
        // Stop spinner from spinning and remove it from the view
        // Present an alert dialog showing the problems encountered during the signup procedure
        let alertController = Utilities.createAlertControllerWithMessage(title: "Error", message: error.localizedDescription, accessibilityIdent: "signupErrorAlertDialog")
        //We are in a background queue so we have to go to the main thread
        DispatchQueue.main.async {
            self.present(alertController, animated: true) {
                
                if self.spinnerController != nil {
                    self.spinnerController!.willMove(toParent: nil)
                    self.spinnerController!.view.removeFromSuperview()
                    self.spinnerController!.removeFromParent()
                }
                
                // return the form to its initial state
                let image = #imageLiteral(resourceName: "meatTradeAddPhoto").withRenderingMode(.alwaysTemplate)
                self.addImageImageView.image = image
                self.addImageImageView.tintColor = .meatTradeRed
                self.profileImage = nil
                self.secureTextField.text = nil
                self.userNameTextField.text = nil
                self.passwordTextField.text = nil
                self.fullNameTextField.text = nil
            }
        }
    }
}
