//
//  AppDelegateRouter_GR.swift
//  NPExplorer_GR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

class AppDelegateRouter_GR:  AppDelegateRouterProtocol{
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        LangConfig.currentLangCode = "de"
        let storyBoard = UIStoryboard.init(name: storyBoardFileName, bundle: nil)
        let npExpController = storyBoard.instantiateInitialViewController()
        let loginRouter = LoginRouter_GR(navigationController: navigationController)
        let updater = LoginUpdater_GR()
        let loginVM = LoginViewModel(withDataManager: LoginDataManager(loginUpdater: updater), withRouter: loginRouter, loginContext: LoginContext(countryCode: CountryCode.germany))
        if var movieListVC = npExpController as? LoginDisplaying {
            movieListVC.viewModel = loginVM
            navigationController?.pushViewController(movieListVC as! UIViewController, animated: false)
        }
    }
}
