//
//  AppDelegateRouter.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

class AppDelegateRouter_IR: AppDelegateRouterProtocol {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyBoard = UIStoryboard.init(name: storyBoardFileName, bundle: nil)
        let npExpController = storyBoard.instantiateInitialViewController()
        let loginRouter = LoginRouter_IR(navigationController: navigationController)
        let updater = LoginUpdater_IR()
        let loginVM = LoginViewModel(withDataManager: LoginDataManager(loginUpdater: updater), withRouter: loginRouter, loginContext: LoginContext(countryCode: CountryCode.ireland))
        if var loginVC = npExpController as? LoginDisplaying {
            loginVC.viewModel = loginVM
            navigationController?.pushViewController(loginVC as! UIViewController, animated: false)
        }
    }
}
