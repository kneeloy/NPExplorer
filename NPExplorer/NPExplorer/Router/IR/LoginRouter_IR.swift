//
//  LoginRouter_IR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit



class LoginRouter_IR: LoginRouterProtocol {
    weak var navigationController: UINavigationController?
    func routeToCountryDetailPage() {
        
    }
    
    func routeToRegisterPage() {
        let storyBoard = UIStoryboard.init(name: storyBoardFileName, bundle: nil)
        //ToDo inject updated config with apikey into updater for CountryDetail
        let userRegistrationUpdater = UserRegistrationUpdater_IR()
        let userRegistrationDataManager = UserRegistrationDataManager_IR(userRegistrationUpdater: userRegistrationUpdater)
        let userRegistrationViewModel = UserRegistrationViewModel_IR(withDataManager: userRegistrationDataManager, withRouter: nil, userRegistrationContext: UserRegistrationContext(countryCode: CountryCode.ireland))
        let userRegistrationController = storyBoard.instantiateViewController(withIdentifier: userRegistrationScreenStoryBoardIdentifier)
        if var userRegistrationVC = userRegistrationController as? UserRegistrationDisplaying_IR {
            userRegistrationVC.viewModel = userRegistrationViewModel
            navigationController?.pushViewController(userRegistrationVC as! UIViewController, animated: false)
        }
    }
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}
