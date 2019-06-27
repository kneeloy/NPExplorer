//
//  RegistrationViewController.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit
protocol UserRegistrationDisplaying_IR {
    var viewModel: UserRegistrationViewModelProtocol_IR? { get set }
}

class RegistrationViewController_IR : UIViewController, UserRegistrationDisplaying_IR {
    public var viewModel: UserRegistrationViewModelProtocol_IR?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        registerButton.addTarget(self, action: #selector(registerButtonSelected), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func registerButtonSelected() {
        if let userName = usernameTextField.text, let password = passwordTextField.text {
            //ToDo Create a model for registrationForm Data
            viewModel?.registerUser(userName: userName, password: password, onSuccess: {[unowned self] (regReply,_) in
                DispatchQueue.main.async {
                    //UI Code
                    if regReply.registrationStatus == "OK"
                    {
                        self.displayAlert(withTitle: alertTitleSuccessText.localized, message: userRegistrationSuccessMessage.localized)
                    } else {
                        self.displayAlert(withTitle: alertTitleErrorText.localized, message: userRegistrationErrorMessage.localized)
                    }
                }
                }, OnFailure: {[unowned self] (_, error) in
                    //Display error
                    DispatchQueue.main.async {
                        self.displayAlert(withTitle: alertTitleErrorText.localized, message: error.localizedDescription)
                    }})
        }
    }
}
