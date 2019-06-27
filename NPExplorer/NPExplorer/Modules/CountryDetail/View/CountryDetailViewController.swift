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

    override func viewDidLoad() {
        viewModel?.fetchCountryDetailAttributes(attributes: [""], success: {(_,_) in }, failure: {(_,_) in })
    }
}
