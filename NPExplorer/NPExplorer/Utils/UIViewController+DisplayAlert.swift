//
//  UIViewController+DisplayAlert.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 27/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayAlert(withTitle: String, message: String) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        
        //ToDo Localization
        alert.addAction(UIAlertAction(title: alertButtonOKText.localized, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
