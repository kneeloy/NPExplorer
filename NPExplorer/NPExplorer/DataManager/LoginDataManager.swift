//
//  LoginDataManager.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDataManagerProtocol {
    //var configUpdater: BaseNetworkClientProtocol_IR? { get set }
    var loginUpdater: LoginUpdaterProtocol? { get set }
    
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, viewController: UIViewController?, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse?)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

public class LoginDataManager: LoginDataManagerProtocol {
    //var configUpdater: BaseNetworkClientProtocol_IR?
    var loginUpdater: LoginUpdaterProtocol?
    
    init(loginUpdater: LoginUpdaterProtocol) {
        //self.configUpdater = withConfigUpdater
        self.loginUpdater = loginUpdater
    }
    
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, viewController: UIViewController? = nil, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse?) -> Void), failure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        
        loginUpdater?.authenticateUser(userAuthForm: userAuthForm, viewController: viewController, success: { [weak self](authReply,urlResponse)  in

            success(authReply, urlResponse)
        }, failure: { (urlResponse, error) in
            failure(urlResponse, error)
        })
    }
}
