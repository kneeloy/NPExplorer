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
                        self.displayAlert(withTitle: "Success!", message: "user Added")
                    } else {
                        self.displayAlert(withTitle: "Success!", message: "user already exist")
                    }
                }
                }, OnFailure: {[unowned self] (_, error) in
                    //Display error
                    DispatchQueue.main.async {
                        self.displayAlert(withTitle: "Error!!", message: error.localizedDescription)
                    }})
        }
    }
    
    //Todo move to a central Util class to avoid code repetation
    private func displayAlert(withTitle: String, message: String) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        
        //ToDo Localization
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
