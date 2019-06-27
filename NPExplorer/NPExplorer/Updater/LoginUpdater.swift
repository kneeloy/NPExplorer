//
//  LoginUpdater.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit
import OktaAuth

protocol LoginUpdaterProtocol {
    
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, viewController: UIViewController?, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse?)->Void),
                      failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

class LoginUpdater_IR: LoginUpdaterProtocol {
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, viewController: UIViewController? = nil, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse?)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        //SSO Implememnt
        print("SSO Authentication")
        guard let viewController  = viewController else {
            failure(nil, NetworkServiceError.cancelled)
            return
        }
        OktaAuth
            .login()
            .start(viewController) { response, error in
                if error != nil { print(error!) }
                
                // Success
                if let tokenResponse = response {
                    OktaAuth.tokens?.set(value: tokenResponse.accessToken!, forKey: "accessToken")
                    OktaAuth.tokens?.set(value: tokenResponse.idToken!, forKey: "idToken")
                    print("Success! Received accessToken: \(tokenResponse.accessToken!)")
                    print("Success! Received idToken: \(tokenResponse.idToken!)")
                    
                    let userAuthModel = UserAuthenticationReplyModel(authenticationKey: tokenResponse.idToken!, userName: "")
                    success(userAuthModel, nil)
                }
                
                
                OktaAuth.userinfo() { response, error in
                    if error != nil { print("Error: \(error!)") }
                    
                    if let userinfo = response {
                        userinfo.forEach { print("\($0): \($1)") }
                    }
                }
        }
    }
}

class LoginUpdater_GR: BaseGRNetworkClient, LoginUpdaterProtocol {
    func authenticateUser(userAuthForm: UserAuthenticationFormModel, viewController: UIViewController? = nil, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse?)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        guard let _ = userAuthForm.userName, let _ = userAuthForm.password else {
            let error = NetworkServiceError.cancelled
            failure(nil, error)
            return
        }
        client.authenticateuserUser(userAuthForm: userAuthForm, success: success, failure: failure)
    }
}
