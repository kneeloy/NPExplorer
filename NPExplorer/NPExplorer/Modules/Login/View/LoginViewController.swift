//
//  LoginViewController.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit
import OktaAuth

protocol LoginDisplaying {
    var viewModel: LoginViewModelProtocol? { get set }
}

class LoginViewController : UIViewController, LoginDisplaying {
    public var viewModel: LoginViewModelProtocol?
    
    //ToDo Localization for Logo text
    @IBOutlet weak var pageLogoLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: UIControl.Event.touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: UIControl.Event.touchUpInside)
        updateUI()
    }
    
    @objc private func loginButtonPressed() {
        if let userName = usernameTextField.text, let password = passwordTextField.text {
            viewModel?.authenticateUser(userName: userName, password: password, viewController: self, onSuccess: {[unowned self] (_,_) in
                DispatchQueue.main.async {
                    //UI Code
                }}, OnFailure: {[unowned self] (_, error) in
                    //Display error
                    DispatchQueue.main.async {
                        self.displayAlert(withTitle: alertTitleErrorText.localized, message: userAuthenticationFailureMessage.localized)
                    }})
        }
    }
    
    func updateUI() {
        guard let viewModel = viewModel else { return }
        pageLogoLabel.text = loginPageText.localized
        if(!viewModel.shouldDisplayPasswordField()) {
            passwordTextField.isHidden = true
        }
    }
    
    @objc private func registerButtonPressed() {
    
        viewModel?.navigateToUserRegistrationPage()
    }
}
