//
//  LoginRouter_GR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter_GR: LoginRouterProtocol {
    weak var navigationController: UINavigationController?
    func routeToCountryDetailPage() {
        
        let storyBoard = UIStoryboard.init(name: storyBoardFileName, bundle: nil)
        let countryDetailUpdater = CountryDetailUpdater_GR()
        let countryDetailDataManager = CountryDetailDataManager(countryDetailUpdater: countryDetailUpdater)
        let countryDetailVM = CountryDetailViewModel(withDataManager: countryDetailDataManager, withRouter: nil, countryDetailContext: CountryDetailContext(countryCode: CountryCode.germany, isLandscape: false))
        let countryDetailController = storyBoard.instantiateViewController(withIdentifier: countryDetailScreenStoryBoardIdentifier)
        if var countryDetailVC = countryDetailController as? CountryDetailDisplaying {
            countryDetailVC.viewModel = countryDetailVM
            navigationController?.pushViewController(countryDetailVC as! UIViewController, animated: true)
        }
    }
    
    func routeToRegisterPage() {
        let storyBoard = UIStoryboard.init(name: storyBoardFileName, bundle: nil)
        //ToDo inject updated config with apikey into updater
        let userRegistrationUpdater = UserRegistrationUpdater_GR()
        let userRegistrationDataManager = UserRegistrationDataManager_GR(userRegistrationUpdater: userRegistrationUpdater)
        let userRegistrationViewModel = UserRegistrationViewModel_GR(withDataManager: userRegistrationDataManager, withRouter: nil, userRegistrationContext: UserRegistrationContext(countryCode: CountryCode.germany))
        let userRegistrationController = storyBoard.instantiateViewController(withIdentifier: userRegistrationScreenStoryBoardIdentifier)
        if var userRegistrationVC = userRegistrationController as? UserRegistrationDisplaying_GR {
            userRegistrationVC.viewModel = userRegistrationViewModel
            navigationController?.pushViewController(userRegistrationVC as! UIViewController, animated: false)
        }
    }
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}
