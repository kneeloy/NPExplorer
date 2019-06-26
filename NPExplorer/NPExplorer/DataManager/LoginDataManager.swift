//
//  LoginDataManager.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol LoginDataManagerProtocol {
    //var configUpdater: BaseNetworkClientProtocol_IR? { get set }
    var loginUpdater: LoginUpdaterProtocol? { get set }
    
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

public class LoginDataManager: LoginDataManagerProtocol {
    //var configUpdater: BaseNetworkClientProtocol_IR?
    var loginUpdater: LoginUpdaterProtocol?
    
    init(loginUpdater: LoginUpdaterProtocol) {
        //self.configUpdater = withConfigUpdater
        self.loginUpdater = loginUpdater
    }
    
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse) -> Void), failure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        
        loginUpdater?.authenticateUser(userAuthForm: userAuthForm, success: { [weak self](token,urlResponse)  in
            //let env = self?.configUpdater?.client.environment
            
            //ToDo find a way to assign the auth token in env
            //self?.configUpdater?.client.environment = env?.netWorkEnvironmentWithApiKey(apiKey: token)
            success(token, urlResponse)
        }, failure: { (urlResponse, error) in
            failure(urlResponse, error)
        })
    }
}
