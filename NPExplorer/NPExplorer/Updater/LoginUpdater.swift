//
//  LoginUpdater.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

protocol LoginUpdaterProtocol {
    
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, success: @escaping ((UserAuthenticationSuccessModelProtocol, URLResponse)->Void),
                      failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

class LoginUpdater_IR: LoginUpdaterProtocol {
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, success: @escaping ((UserAuthenticationSuccessModelProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        //SSO Implememnt
        print("SSO Authentication")
        
    }
}

class LoginUpdater_GR: BaseGRNetworkClient, LoginUpdaterProtocol {
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, success: @escaping ((UserAuthenticationSuccessModelProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        guard let password = userAuthForm.password else {
            let error = NetworkServiceError.cancelled
            failure(nil, error)
            return
        }
        client.authenticateuserUser(userAuthForm: userAuthForm, success: success, failure: failure)
    }
}
