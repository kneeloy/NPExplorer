//
//  RegistrationViewController_GR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

protocol UserRegistrationDisplaying_GR {
    var viewModel: UserRegistrationViewModelProtocol_GR? { get set }
}

class RegistrationViewController_GR : UIViewController, UserRegistrationDisplaying_GR {
    public var viewModel: UserRegistrationViewModelProtocol_GR?
    
    @IBOutlet weak var passCodeTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        registerButton.addTarget(self, action: #selector(registerButtonSelected), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func registerButtonSelected() {
        if let passcode = passCodeTextField.text {
            viewModel?.registerUser(passcode: passcode, onSuccess: {[unowned self] (_,_) in
                DispatchQueue.main.async {
                    //UI Code
                }
                }, OnFailure: {[unowned self] (_, error) in
                    //Display error
                    DispatchQueue.main.async {
                        //self.displayAlert(withTitle: "Error!!", message: error.localizedDescription)
                    }})
        }
    }
}
