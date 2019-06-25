//
//  RouterBuilder.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

protocol AppDelegateRouterProtocol {
    func start()
}

protocol LoginRouterProtocol {
    func routeToRegisterPage()
    func routeToCountryDetailPage()
    var navigationController: UINavigationController? { get }
}

protocol UserRegistrationRouterProtocol {}
protocol CountryDetailRouterProtocol {}

class AppDelegateRouterBuilder {
    static func getAppDelegateRouter(navigationController: UINavigationController) -> AppDelegateRouterProtocol {
        #if MARKET_IR
        return AppDelegateRouter_IR(navigationController: navigationController)
        #elseif MARKET_GR
        return AppDelegateRouter_GR(navigationController: navigationController)
        #endif
        
    }
}
