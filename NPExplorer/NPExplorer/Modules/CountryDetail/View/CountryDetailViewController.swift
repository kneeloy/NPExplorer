//
//  CountryDetailViewController.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 25/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

protocol CountryDetailDisplaying {
    var viewModel: CountryDetailViewModelProtocol? { get set }
}

class CountryDetailViewController : UIViewController, CountryDetailDisplaying {
    var viewModel: CountryDetailViewModelProtocol?
    private var isLandscape = false
    
    override func viewDidLoad() {
        viewModel?.fetchCountryDetailAttributes(attributes: [""], success: {[weak self](_,_) in
            guard let self = self else { return }
            
            if let attrb = self.viewModel?.getCountryDetailAttributes()?.joined(separator:"-") {
                self.displayAlert(withTitle: "Attributes", message: attrb)
            }
        }, failure: {(_,_) in })
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // Only allow Portrait
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        viewModel?.isLandscape = size.width > size.height
        
        coordinator.animate(alongsideTransition: { [weak self] _ in
            guard let self = self else { return }
            self.configureUILayout()
        })
    }
    
    private func configureUILayout() {
        
        //ChangeUI Code
        if let attrb = viewModel?.getCountryDetailAttributes()?.joined(separator:"-") {
            displayAlert(withTitle: "Attributes", message: attrb)
        }
    }
}
